import (
	"bytes"
	"image"
	"image/jpeg"
	"log"

	"github.com/disintegration/imaging"
)

func Resize() {
	imageSrc, _ := imaging.Decode(bytes.NewReader(tempImage))
	width := imageSrc.Bounds().Max.X
	height := imageSrc.Bounds().Max.Y
	log.Println(width, height)
	maxSize := func() int {
		if mainOrSub == "main" {
			return maxMainImageSize
		}
		return maxSubImageSize
	}()

	if width >= maxSize || height >= maxSize {
		// 保存する画像がサイトの表示サイズより大きかったら小さくResizeする
		log.Println("Resizing Image")
		smallImage := func() *image.NRGBA {
			if width >= height {
				// 横長なら横をリサイズして、縦は比率を保つ
				return imaging.Resize(imageSrc, maxSize, 0, imaging.Lanczos)
			}
			// 縦長なら縦をリサイズして、幅は比率を保つ
			return imaging.Resize(imageSrc, 0, maxSize, imaging.Lanczos)
		}()
		buf := new(bytes.Buffer)
		err := jpeg.Encode(buf, smallImage, nil)
		if err != nil {
			log.Fatal("JPEG Encoding Error")
			return nil, err
		}
		return bytes.NewReader(buf.Bytes()), nil
	}
	// リサイズしない場合は、Original画像のReadSeakerをそのまま返す
	log.Println("No resize")
	return bytes.NewReader(tempImage), nil
}
