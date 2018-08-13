#!/bin/bash

function write {
    echo -e "$1" >> ../_posts/$folder/"$date-$file_title.md"
}

function parse_args {
    while [ $# -gt 0 ]
    do
        key=$1

        case $key in
            -p|--profile)
                profile=true
                github="$2"
                shift
                shift
                ;;
            -f|--file)
                profile=true
                list=true
                prof_file="$2"
                shift
                shift
                ;;
            -u|--update)
                profile=true
                list=true
                delete=true
                prof_file="$2"
                shift
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                usage
                exit 1
                ;;
        esac
    done
}

function usage {
    echo "Usage: [-h] [-p link] [-f file]"
    echo "  -p link  Specify link to use for creation of a profile post"
    echo "  -f file  Specify file to use for creation of a series of profile posts"
    echo "  -u file  Update profile posts using a file of links"
    echo "  -h       Display this message"
}

function ask_for_vars {
    read -p "Is this a profile? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        profile=true
    else
        profile=false

        read -p "Title: " title
        read -p "Description: " desc
    fi

    read -p "GitHub/GitLab URL: " github

}

function clone_repo {
    tmp_folder=tmp-$(date +%s)
    mkdir $tmp_folder
    cd $tmp_folder

    git clone --depth 1 $github ./

    if [ $profile = true ]
    then
        title=$(grep -i 'title:' inspec.yml | sed 's/title: //i')
    fi

    file_title=$(echo "$title" | tr " " "-" | tr A-Z a-z)
}

function write_front_matter {

    date=$(date +%Y-%m-%d)

    write "---"

    if [ $profile = false ]
    then
        write "layout: post"
        write "title: $title"
        write "date: $date"
        write "desc: $desc"
        write "permalink: $file_title"
        write "github: $github"
        write "category: readme"
    else
        write "layout: post"
        write "date: $date"
        write "github: $github"
        write "category: profile"

        if [ -f ./inspec.yml ]
        then
            write "\n"
            write "# inspec.yml"
            cat inspec.yml >> ../_posts/$folder/"$date-$file_title.md"
        fi
    fi

    write "---\n"
}

function copy_images {
    images=$(sed -Ene 's#^\!\[.*\]\(([^ ?]*).*\).*$#\1#p' < README.md)

    for path in images
    do
        orig_path=$path
        path=".$path"
        mimetype=$(file --mime-type -b $path)

        if [[ mimetype == "image/"* ]]
        then
            if [ ! -d "../assets/images/$date-$file_title" ]
            then
                echo Making /assets/images/$folder/$date-$file_title...
                mkdir ../assets/images/$folder/$date-$file_title
            fi

            if [ ! -d "../assets/images/$folder/$date-$file_title/$(dirname $path)" ]
            then
                echo Making /assets/images/$folder/$date-$file_title/$(dirname $path)...
                mkdir -p ../assets/images/$folder/$date-$file_title/$(dirname $path)
            fi

            echo Copying image $path...
            cp $path "../assets/images/$folder/$date-$file_title/$path"

            sed -i "s#$orig_path#{{ \"/assets/images/$folder/$date-$file_title$orig_path\" | relative_url }}#g" ../_posts/$folder/"$date-$file_title.md"

        fi
    done
}

function clean_up {
    cd ..
    rm -rf $tmp_folder
}

function create_profile {
    clone_repo

    title=$(grep -i -m1 'name: ' inspec.yml | sed 's/name: //i')
    file_title=$(echo "$title" | tr " " "-" | tr A-Z a-z)

    write_front_matter

    cat README.md >> ../_posts/$folder/"$date-$file_title.md"

    if [ -f attributes.yml ]
    then
        write "\n"

        cat >> ../_posts/$folder/"$date-$file_title.md" << EOF

# Configuration through attributes.yml
<table class="table">
  <thead class="thead">
  <tr>
    <th>Attribute</th>
    <th>Default Value</th>
  </tr>
  </thead>
  {% for attr in site.data.${date}-${file_title}-attrs  %}
    <tr>
      <td>{{attr[0]}}</td>
      <td>{% for val in attr[1] %}
        {{val}}{% unless forloop.last %}, {% endunless %}
      {% endfor %}</td>
    </tr>
  {% endfor %}
</table>

EOF

        cat attributes.yml > ../_data/"$date-$file_title-attrs.yml"
fi

    copy_images

    clean_up
}

function profile_list {
    while read line
    do
        echo Creating profile from $line
        github=$line
        create_profile
    done < $prof_file
}

function delete_profiles {
    rm -rf _posts/$folder/*
    rm -rf _data/*attrs.yml
}

function create_application {

    clone_repo

    write_front_matter

    cat README.md >> ../_posts/$folder/"$date-$file_title.md"

    copy_images

    clean_up
}

if [ $# -gt 0 ]
then
    parse_args $@
else
    ask_for_vars
fi

if [ $profile = true ]
then
    folder="profiles"
    if [ "$list" = "true" ]
    then
        if [ "$delete" = "true" ]
        then
            delete_profiles

            echo Using list $prof_file
            profile_list
        else
            echo Using list $prof_file
            profile_list
        fi
    else
        create_profile
    fi

    if [ -f _posts/$folder/$date-.md ]
    then
        rm _posts/$folder/$date-.md
    fi
else
    folder="applications"

    create_application
fi
