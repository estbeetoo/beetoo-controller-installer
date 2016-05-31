////////Для Beetoo Instailer v 0.0.1\\\\\\\\


_____1_____ Установить программу Inno Setup ("http://www.jrsoftware.org/isinfo.php")

_____2_____ Поместить папку с файлами BeeToo в корень диска C ("C:\beetoo")

_____3_____ Открыть файл Beetoo.iss (находится в папке beetoo)

_____4_____ Проверить в файле Beetoo.iss пути к файлам для компиляции установщика.
Проверить поля:

------[Setup]------
LicenseFile=C:\beetoo\License.rtf ("Файл")
WizardImageFile=C:\beetoo\Logo\BeeTooProgLogo164x314.bmp ("Файл изображения слева в инсталляторе")
WizardSmallImageFile=C:\beetoo\Logo\BeeTooProgLogo55x58.bmp ("Файл изображения сверху справа")
SetupIconFile=C:\beetoo\Logo\BeeToo.ico ("Файл иконки")

------[Files]------
Source: "C:\beetoo\Node\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs sortfilesbyextension (Расположение файлов для установки)

_____5_____ Запустить компиляцию, в результате будет создан готовый инсталлятор.