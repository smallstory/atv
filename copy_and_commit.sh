#!/bin/bash

# 文件名变量
FILE_NAME="test.csv"
# 源文件路径
SOURCE_FILE="/Users/xufengchao/project/aStock/results/$FILE_NAME"
# 目标文件路径（当前目录）
DEST_FILE="/Users/xufengchao/project/atv/$FILE_NAME"

# 拷贝文件，覆盖目标文件
echo "Copying $FILE_NAME from $SOURCE_FILE to $DEST_FILE..."
cp -f "$SOURCE_FILE" "$DEST_FILE"

# 检查拷贝是否成功
if [ $? -eq 0 ]; then
    echo "File copied successfully!"
    
    # 提交到git
    echo "Committing to git..."
    cd "/Users/xufengchao/project/atv" || exit 1
    
    # 添加文件
    git add "$FILE_NAME"
    
    # 提交
    git commit -m "Update $FILE_NAME from aStock results"
    
    # 推送到远程
    git push
    
    if [ $? -eq 0 ]; then
        echo "Git push successful!"
    else
        echo "Git push failed!"
        exit 1
    fi
else
    echo "File copy failed!"
    exit 1
fi

echo "Script completed successfully!"