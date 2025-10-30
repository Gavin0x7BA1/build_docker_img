# ---- 1. 官方基础镜像 ----
FROM ubuntu:24.04

# ---- 2. 安装 Python 3.12（24.04 自带） ----
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# ---- 3. 复制并安装依赖 ----
WORKDIR /app
COPY app/requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# ---- 4. 默认入口 ----
# api.py 由运行者通过挂载提供
CMD ["python3", "api.py"]