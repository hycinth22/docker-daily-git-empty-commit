# docker_push_git
docker镜像，定时向指定仓库推送空提交

通过环境变量设定参数

+ GIT_URL：仓库地址，http(s)可填写 http(s)://username:password@domain/path 的形式进行密码认证
+ GIT_EMAIL Git邮箱
+ GIT_NAME ：Git昵称
+ PRIVATE_KEY ：SSH私钥（如果GIT_URL设定中使用了SSH地址）
+ CRON_TIME：推送时间(CRON格式)，默认为0 7 * * *

# Getting Started

1. Change to work directory

    cd /path/to/the/repo

2. Clone the repo

    git clone https://github.com/pastral1024/docker-daily-git-empty-commit.git .

3. Build the image

    docker build --tag ik:dailyEmptyGitCommit /path/to/the/repo

4. Create & Start a container

    docker run -it --name dailyEmptyGitCommit -e "GIT_URL=RepoURL" -e "GIT_EMAIL=YourEmail" -e "GIT_NAME=YourName" -e "PRIVATE_KEY=YourKeyContent" ik:dailyEmptyGitCommit
