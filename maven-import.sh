#!/bin/bash
# 一个用于批量上传文件到 Nexus 的标准脚本

# 获取命令行参数
while getopts ":r:u:p:" opt; do
    case $opt in
        r) REPO_URL="$OPTARG"
        ;;
        u) USERNAME="$OPTARG"
        ;;
        p) PASSWORD="$OPTARG"
        ;;
    esac
done

# 查找所有文件，并逐个通过 PUT 请求上传到 Nexus
find . -type f \
  -not -path './mavenimport\.sh*' \
  -not -path '*/\.*' \
  -not -path '*/\^archetype\-catalog\.xml*' \
  -not -path '*/\^maven\-metadata\-local*\.xml' \
  -not -path '*/\^maven\-metadata\-deployment*\.xml' \
  | sed "s|^\./||" \
  | xargs -I '{}' curl -u "$USERNAME:$PASSWORD" -X PUT -v -T {} ${REPO_URL}{} ;

# ./maven-import.sh -u admin -p dy6545286 -r http://172.16.30.135:8081/repository/public/
