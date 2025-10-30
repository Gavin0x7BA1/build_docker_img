FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

# 1. 装 Python 和编译工具
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-venv python3-pip build-essential ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 2. 创建并激活虚拟环境
ENV VENV=/opt/venv
RUN python3 -m venv $VENV
ENV PATH="$VENV/bin:$PATH"

# 3. 安装依赖
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. 复制其余文件（可选）
COPY . .

# 5. 启动命令
CMD ["python3","api.py"]