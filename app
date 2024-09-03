name: Upload APK to the Rootpk Store

on:
  release:
    types: [published]

jobs:
  upload:
    name: Upload
    runs-on: ubuntu-latest
    steps:
      - name: Download release assets
        uses: robinraju/release-downloader@efa4cd07bd0195e6cc65e9e30c251b49ce4d3e51 # v1.8
        with:
          repository: "{FintCircle}/{Readable}" # Replace with your repository's owner and name
          latest: true
          fileName: "Readable.apK" # Replace with your APK's filename
          out-file-path: "assets"
          #token: ${{ secrets.GITHUB_TOKEN }} # Required if your repo is private
      - name: Upload APK to the Rootpk Store
        working-directory: ./assets/
        env:
          ROOTPK_APP_ID: ${{ secrets.ROOTPK_APP_ID }}
          ROOTPK_APP_SECRET_KEY: ${{ secrets.ROOTPK_APP_SECRET_KEY }}
        run: |
          curl https://api.rootpk.com/apk/upload \
            -F appId="$ROOTPK_APP_ID" \
            -F secretKey="$ROOTPK_APP_SECRET_KEY" \
            -F file=@Readable.apk # Make sure this matches your APK's filename

curl https://api.rootpk.com/icons/upload ^
  -F appId=66d6e00de4d1432db5a37597 ^
  -F secretKey=rootpk_7e44b204-e148-4c9a-bb32-78c38565bf2f ^
  -F file=@i.ibb.co/s66P3z8/letter-r-6.png
curl https://api.rootpk.com/icons/upload `
  -F appId=66d6e00de4d1432db5a37597 `
  -F secretKey=rootpk_7e44b204-e148-4c9a-bb32-78c38565bf2f `
  -F file=@i.ibb.co/s66P3z8/letter-r-6.png
