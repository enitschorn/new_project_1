user_lang=$(echo $LANG | cut -d '.' -f 1)
user_lang=$(echo $LANG | cut -d '_' -f 1)

langs=($(locale -a | cut -d '.' -f 1))
for lang in "${langs[@]}"
do
  lang_array+=($(echo $lang | cut -d '_' -f 1))
done
lang_array=($(echo "${lang_array[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

for lang in "${lang_array[@]}"
do
    if grep -q "$user_lang" <<< "$lang"
      then
        input="./greetings/hello-${user_lang}.txt"
        while IFS= read -r line
        do
          echo "$line"
        done < "$input"
    fi
done
