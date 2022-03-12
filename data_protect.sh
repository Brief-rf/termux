#!/data/data/com.termux/files/usr/bin/bash

path=~/
ssh_path=$(path).ssh
encrypt_file(){
  for file in `ls $ssh_path`
  do
      echo "openssl enc -aes-256-cbc -salt -in .ssh/$file -out .ssh/$file.enc"
      openssl enc -aes-256-cbc -salt -k $1 -in .ssh/$file -out .ssh/$file.enc
      echo $file
      rm -rf .ssh/$file
  done
}
decrypt_file(){
  for file in `ls $ssh_path`
  do
      echo "openssl enc -aes-256-cbc -d -in .ssh/$file.enc -out .ssh/$file"
      openssl enc -aes-256-cbc -d -k $1 -in .ssh/$file -out .ssh/${file%.*}
      rm -rf .ssh/$file
  done
}

main(){
  if [ $# -eq 0 ]
  then
    echo "Usage: $0 <encrypt|decrypt> <key>"
    exit 1
  else
    if [ $1 = "encrypt" ]
    then
      encrypt_file $2
    elif [ $1 = "decrypt" ]
    then
      decrypt_file $2
    else
      echo "Usage: $0 <encrypt|decrypt> <key>"
      exit 1
    fi
  fi
  chmod 600 ~/.ssh/id_rsa
}
# main program starts here
if [[ "${BASH_SOURCE[0]}" == "${0}" ]];
then
  main "$@"
fi
