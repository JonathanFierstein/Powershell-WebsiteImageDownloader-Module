# Define the website URL and minimum resolution
$websiteUrl = "https://www.example.com"
$minWidth = 640
$minHeight = 480

# Function to download images
function Download-Image {
    param (
        $imageUrl,
        $filePath
    )

    try {
        $response = Invoke-WebRequest -Uri $imageUrl
        if ($response.StatusCode -eq 200 -and $response.ContentLength -gt 0) {
            $contentType = $response.Content.Headers.ContentType
            if ($contentType -match "image/jpeg") {
                $image = New-Object System.Drawing.Image($response.Content)
                if ($image.Width -ge $minWidth -and $image.Height -ge $minHeight) {
                    $image.Save($filePath)
                    Write-Host "Downloaded: $filePath"
                } else {
                    Write-Host "Image resolution too low: $imageUrl"
                }
            }
        } else {
            Write-Host "Error downloading image: $imageUrl - Status code: $response.StatusCode"
        }
    } catch {
        Write-Error "Error downloading image: $imageUrl - $_"
    }
}

# Recursive function to crawl website and download images
function Crawl-Website {
    param (
        $url
    )

    $html = Invoke-WebRequest -Uri $url -UseBasicParsing

    # Extract image URLs from current page
    $imageUrls = $html.ParsedHtml.Images | Select-Object -ExpandProperty Src

    foreach ($imageUrl in $imageUrls) {
        # Check if it's a full URL
        if ($imageUrl -notmatch "^(http|https)://") {
            $imageUrl = "$websiteUrl/$imageUrl"
        }

        # Download the image
        $filename = $imageUrl.Split("/")[-1]
        $filePath = "C:\Downloads\$filename"
        Download-Image $imageUrl $filePath
    }

    # Extract links to subpages
    $links = $html.ParsedHtml.Links | Where-Object { $_.Href -match "^/" } | Select-Object -ExpandProperty Href

    foreach ($link in $links) {
        $subPageUrl = "$websiteUrl$link"
        Crawl-Website $subPageUrl
    }
}

# Start crawling the website
Crawl-Website $websiteUrl
Write-Host "Finished downloading images."
