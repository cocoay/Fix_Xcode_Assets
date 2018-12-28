
#Archives地址
PATH_ARCHIVES=~/Library/Developer/Xcode/Archives

#项目名称
PROJ_NAME="APP"

#尾部名称
PATH_LAST=Products/Applications/$PROJ_NAME.app

#日期，默认为当天，可以设置参数 eg: 20181228
DATE_NOW="$1"
reg="^201[0-9]{5}$"
if [[ $DATE_NOW =~ $reg ]]
then
    DATE_NOW="${DATE_NOW:0:4}-${DATE_NOW:4:2}-${DATE_NOW:6:2}"
else
    DATE_NOW=`date +"%Y-%m-%d"`
fi

#修改符号（空格）
old_IFS=$IFS
IFS=$(echo -en "\n\b")

#读取记录，有记录的的不会修改
while read line
do
    files=(${files[@]} $line)
done <record.txt

#按日期查找项目并筛选项目名称
reg="^$PROJ_NAME"
for file in `ls "$PATH_ARCHIVES/$DATE_NOW" | grep $reg`
do
    if echo "${files[@]}" | grep -w "$file" &>/dev/null
    then  
        echo "记录中已包含：$file"
    else
        cp Assets.car "$PATH_ARCHIVES/$DATE_NOW/$file/$PATH_LAST"
        echo "已修改：$file"
        echo "$file" >>record.txt
    fi
done
#还原符号（空格）
IFS=$old_IFS
echo "======已完成======"
