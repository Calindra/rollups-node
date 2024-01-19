use std::error::Error;

pub async fn fetch_blob(hash: &str) -> Result<Vec<u8>, Box<dyn Error>> {
    println!("syscoin fetching {}...", hash);
    let url = format!("https://poda.syscoin.org/vh/{}", hash);
    let response = reqwest::get(&url).await?;
    let text = response.text().await?;
    let bytes = hex::decode(&text)?;
    Ok(bytes)
}

#[cfg(test)]
mod test {
    use super::fetch_blob;

    #[tokio::test]
    async fn it_works() {
        let hash = "3f57aba5d95da7d40bcd9f19f1e559851cd9d4f5f537c7226e7e11dab804db9e";
        let _ = fetch_blob(hash).await;
    }
}