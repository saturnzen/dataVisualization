import pandas as pd

# Reorder the data according to "Bình thường" -> "Trước dịch" -> "Đỉnh dịch"
data_ordered = [
    ["Rửa tay", 0.50, 0.50, 0.70, "Bình thường"],
    ["Rửa tay", 0.50, 0.60, 0.85, "Trước dịch"],
    ["Rửa tay", 0.50, 0.80, 1.00, "Đỉnh dịch"],

    ["Khẩu trang", 0.60, 0.30, 0.60, "Bình thường"],
    ["Khẩu trang", 0.75, 0.50, 0.80, "Trước dịch"],
    ["Khẩu trang", 0.85, 0.70, 1.00, "Đỉnh dịch"],

    ["Xịt khuẩn bề mặt", 0.30, 0.40, 0.50, "Bình thường"],
    ["Xịt khuẩn bề mặt", 0.50, 0.30, 0.60, "Trước dịch"],
    ["Xịt khuẩn bề mặt", 0.70, 0.10, 0.80, "Đỉnh dịch"],

    ["Xúc miệng nước muối", 0.20, 0.60, 0.50, "Bình thường"],
    ["Xúc miệng nước muối", 0.25, 0.65, 0.60, "Trước dịch"],
    ["Xúc miệng nước muối", 0.30, 0.70, 0.70, "Đỉnh dịch"],

    ["Tránh tụ tập đông người", 0.40, 0.20, 0.50, "Bình thường"],
    ["Tránh tụ tập đông người", 0.60, 0.30, 0.80, "Trước dịch"],
    ["Tránh tụ tập đông người", 0.80, 0.40, 1.00, "Đỉnh dịch"],

    ["Thông gió phòng", 0.40, 0.50, 0.70, "Bình thường"],
    ["Thông gió phòng", 0.50, 0.55, 0.80, "Trước dịch"],
    ["Thông gió phòng", 0.60, 0.60, 0.90, "Đỉnh dịch"],

    ["Vaccine chủng ngừa", 1.00, 0.50, 0.70, "Bình thường"],
    ["Vaccine chủng ngừa", 1.00, 1.00, 0.50, "Trước dịch"],
    ["Vaccine chủng ngừa", 1.00, 1.00, 1.00, "Đỉnh dịch"],

    ["Ở nhà khi có triệu chứng", 0.70, 0.40, 0.80, "Bình thường"],
    ["Ở nhà khi có triệu chứng", 0.80, 0.60, 0.90, "Trước dịch"],
    ["Ở nhà khi có triệu chứng", 0.90, 0.70, 1.00, "Đỉnh dịch"],

    ["Kháng sinh dự phòng người tiếp xúc gần", 0.90, 0.20, 0.90, "Bình thường"],
    ["Kháng sinh dự phòng người tiếp xúc gần", 0.90, 0.30, 0.95, "Trước dịch"],
    ["Kháng sinh dự phòng người tiếp xúc gần", 0.95, 0.40, 1.00, "Đỉnh dịch"],
]

df_ordered = pd.DataFrame(data_ordered, columns=[
    "Biện pháp phòng bệnh",
    "Hiệu quả giảm lây nhiễm",
    "Mức độ đơn giản tuân thủ",
    "Sự cần thiết phải tuân thủ",
    "Thời điểm đánh giá"
])

# Save CSV with UTF-8 encoding
file_path_utf8 = "/mnt/data/behavioral_prevention_measures_utf8.csv"
df_ordered.to_csv(file_path_utf8, index=False, encoding='utf-8-sig')

file_path_utf8
