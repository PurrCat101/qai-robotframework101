from openpyxl import Workbook

wb = Workbook()
ws = wb.active
ws.title = "MockData"
ws.append(["Name", "Age", "Country"])
ws.append(["Alice", 30, "Thailand"])
ws.append(["Bob", 25, "Japan"])
ws.append(["Charlie", 28, "USA"])
wb.save("f:/เนื้อหาสำหรับสอน automate testing/qai-robotframework101/excel/mock_data.xlsx")
