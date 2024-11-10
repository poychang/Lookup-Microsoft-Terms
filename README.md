# Lookup Microsoft Terms

原本 Microsoft 有提供 Microsoft Terminology 的查詢網站，可以查詢 Microsoft 的術語，但是現在已經無法使用了。

不過 Microsoft 有提供 `.tbx` 格式的檔案，裡面有各種語言的術語，可以透過從[這裡下載壓縮檔](https://download.microsoft.com/download/b/2/d/b2db7a7c-8d33-47f3-b2c1-ee5e6445cf45/MicrosoftTermCollection.zip)。

該檔案內容為 XML 格式，為了方便使用，預計建立一個 Web App，可以透過網頁查詢 Microsoft 的術語。

> 此專案內僅保留壓縮檔中的 `Chinese (Traditional).tbx` （更名為 `terms.tbx`，並移除檔案中不會使用到的 `termNote`），其餘語言請參考原始檔案。

## 使用方式

除了直接使用網頁進行查詢，也支援使用 `?q=KEY-WORLD` 的方式進行搜尋，例如要查詢 `program` 這個關鍵字，可以使用 `https://lookup-terms.poychang.net?q=program` 的方式查詢。
