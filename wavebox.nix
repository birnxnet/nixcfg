final: prev: {
  wavebox = prev.wavebox.overrideAttrs (oldAttrs: {
    version = "10.133.4-2";
    src = prev.fetchurl {
      url = "https://download.wavebox.app/stable/linux/deb/amd64/wavebox_10.133.4-2_amd64.deb";
      hash = "0sy3y5g4n1kjlviy0kzlc8ym7xglgi9kvc3yxknb8n7bq77yzc8k";
    };
  });
}
