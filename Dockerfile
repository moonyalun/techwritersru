name: Build and Deploy Sphinx Documentation

on:
  push:
    branches:
      - develop

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build and run Docker image
        run: |
          docker build -t techwritersweb .
          docker run -v $PWD:/app techwritersweb

      - name: Install lftp
        run: sudo apt-get install lftp -y

      - name: Show Built Documentation Path
        run: |
          docker run -v $PWD:/app techwritersweb /bin/sh -c "echo 'Built documentation at: /app/build/html'"

      - name: Upload to FTP server
        run: |
          lftp -c "open -u $FTP_USERNAME,$FTP_PASSWORD $FTP_SERVER; mirror -R /app/build/html /path/to/remote/directory"
        env:
          FTP_SERVER: ${{ secrets.FTP_HOST }}
          FTP_USERNAME: ${{ secrets.FTP_USERNAME }}
          FTP_PASSWORD: ${{ secrets.FTP_PASSWORD }}
