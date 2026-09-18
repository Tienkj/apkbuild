# RootRemoteServer 📱🖥️

Biến điện thoại Android đã root (Magisk) thành máy chủ điều khiển từ xa (Remote-Control Server) qua mạng Wi-Fi/LAN độc lập.
Sau khi cài đặt file APK lên máy, điện thoại sẽ tự động phát web server tại địa chỉ:
http://192.168.1.136:8080 (hoặc IP Wi-Fi của máy). PC mở trình duyệt là điều khiển được ngay mà không cần cắm cáp USB, không cần ADB, không cần scrcpy.

### 1. Cách tạo file app-debug.apk nhanh nhất (1 Click):
- **Trên Windows**: Bấm đúp chuột vào file `build_apk.bat`
- **Trên Linux / macOS**: Chạy `./build_apk.sh`
- Hoặc dùng dòng lệnh:
```bash
./gradlew assembleDebug
```
File APK xuất ra tại: `app/build/outputs/apk/debug/app-debug.apk`

### 2. Tự động Build APK qua GitHub Actions (Không cần cài Java/Android Studio trên máy tính):
- Tải project lên repository GitHub của bạn.
- File `.github/workflows/build-apk.yml` sẽ tự động biên dịch và cung cấp link tải trực tiếp file APK hoàn tất trong mục **Actions** > **Artifacts**.

### 3. Cài đặt lên điện thoại Android (Galaxy A03s):
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```
Hoặc copy file APK qua Zalo, Drive hoặc thẻ nhớ rồi bấm Cài đặt (Install) trên điện thoại.

### 4. Cấp quyền Root & Bật Server:
1. Mở ứng dụng **RootRemoteServer** trên điện thoại.
2. Bấm nút **"Request Root"** -> Hộp thoại Magisk Superuser hiện lên -> Chọn **"Grant"** (Cấp quyền vĩnh viễn).
3. Bấm **"Start Server"**.
4. Ứng dụng sẽ hiển thị địa chỉ IP: `http://192.168.1.136:8080`

### 5. Điều khiển từ PC:
Mở trình duyệt PC (Chrome, Firefox, Edge) cùng mạng Wi-Fi:
Truy cập: `http://192.168.1.136:8080`
Đăng nhập tài khoản: `admin` / `admin123` -> Toàn quyền điều khiển màn hình, ứng dụng, bàn phím, clipboard và tập tin!

### 6. Cứu hộ điện thoại vỡ màn hình / liệt cảm ứng (Headless Auto-Start):
Nếu máy bị liệt màn hình không bấm được:
Copy file `magisk/service.sh` vào thư mục Magisk của máy:
```bash
adb push magisk/service.sh /data/adb/service.d/root_remote.sh
adb shell chmod 755 /data/adb/service.d/root_remote.sh
```
Server sẽ tự động kích hoạt ngay khi máy khởi động lại!