# build_docker_img
build docker img for ai code review

## 仓库目录结构
```
my-ubuntu-api/
├── .github/
│   └── workflows/
│       └── build.yml      # 自动构建并推送到 GHCR
├── app/
│   └── requirements.txt   # 只放依赖，不放 api.py
├── Dockerfile
├── run.sh                 # 本地一键运行示例（可选）
└── README.md
```

## run
```
#!/usr/bin/env bash
set -e
# docker build -t my-ubuntu-api:local .
docker run --rm -it -p 8000:8000 -v "$(pwd)/api.py:/app/api.py:ro" my-ubuntu-api:local
```