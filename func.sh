#!/bin/sh


# read yaml file
#ex: eval $(parse_yaml config.yml "config_")
 
# access yaml content
#echo $config_development_database

parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

# Copy files, if exists then overwrite. arg1 = file, arg2 = destination
copy(){
    if [ ! -d "$2" ]; then
        mkdir -p "$2"
    fi
    cp -R "$1" "$2"
}

# Check if software has been installed
exists(){
    hash "$1" 2>/dev/null || { return 0 }
}

# Check if symlink exits
symlink_exists(){
    if [ ! \( -e "${file}" \) ]
    then
        return 0;
    fi
}
        
