#!/bin/bash
# Renames a file based on something from its content
# for i in a b c;
#  do echo mv $i `egrep -m1 -e 'IDtag ID[0-9]*' $i | sed -e 's/IDtag ID//'`;
# done

for file in `find $PWD -type f -name *.html` ;
do
   DIRECTORY=$(dirname "$file")
   NEWNAME=$(grep -o '<span class="entry-title">[^<]*<\/span>' $file)
   REVIWEDNAME=$(echo $NEWNAME | sed 's/\(<span class="entry-title">\)\([^<]*\)\(<\/span>\)/\2/g')
   mv $file $DIRECTORY/"$REVIWEDNAME".html
done
