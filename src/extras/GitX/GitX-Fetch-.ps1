function GitX-Fetch {
    git fetch --all --prune --tags;
    $regex = [System.Text.RegularExpressions.Regex]::new("^(.*?)\[origin/(.*?): gone\](.*?)$", [System.Text.RegularExpressions.RegexOptions]::Multiline);
    git branch -ravv | ForEach-Object { if ($regex.IsMatch($_)) {
            git branch -D $($regex.Match($_).Groups[2].Value);
        }
    };
    GBA;
}