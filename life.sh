#!/bin/bash
# looks for the future in your directory

USAGE="USAGE: 
       no arguments, looks for the \"future\" word and gather those files
       -n, --new     creates a file \"future.txt\" in the current directory
                     and add some text
       -h, --help    ask for help to figure your future out"

: <<'com'
# check if there are any typos in the command       
syntax_check () {
       # check for unused arguments
       if [[ "${v}" -gt 0 ]]; then
              err "Invalid syntax!"
              echo "${USAGE}"
              exit 1 
       fi
}

# check if everything went smoothly
check () {
       if [[ $? == 1 ]]; then
              echo "ERROR: copy gone wrong"
              exit 1
       fi

}
com

v=0
while [[ $# -gt 0 ]]; do
       arg="${1}"

       #look for options
       case "${arg}" in
              "-h" | "--help")
                     echo "Sorry, still figuring out"
                     echo "${USAGE}"
                     exit 0
                     ;;
              "-n" | "--new")
                     echo "Just some tips: new job? New style? New friends?" | cat > future.txt
                     echo "Current state: "
                     cat future.txt
                     echo "Let's start from scratch"
                     exit 0
                     shift
                     ;;
              *)
                     v+=1
                     shift  
                     ;;
       esac
done

# check if there are any typos in the command       
if [[ "${v}" -gt 0 ]]; then
              err "Invalid syntax!"
              echo "${USAGE}"
              exit 1 
       fi

# look for the Future
grep -rl future "${PWD}" | cat > now.txt

# did we find any future?
if [[ ! -s now.txt ]]; then
       echo "Looks like there is no future in this directory, consider using the \"-n\" option"
       exit 0
fi

# check if everything went smoothly
if [[ $? == 1 ]]; then
              echo "ERROR: copy gone wrong"
              exit 1
else
       echo "done"
fi




