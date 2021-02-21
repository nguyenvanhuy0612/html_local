import pandas as pd
import matplotlib.pyplot as plt

file_path = r"data\ex.xlsx"
sheet = "PACTRA JAN"

excel_data_df = pd.read_excel(file_path, sheet_name=sheet, index_col=0)
# print(excel_data_df.head())
# print(excel_data_df.tail(10))
# print(excel_data_df.columns)
# excel_data_df['TOTAL VND \n(+VAT)'].head(15).plot(kind="barh")
# plt.show()


print(excel_data_df.info())
print(excel_data_df.shape)
# print(excel_data_df['TOTAL VND \n(+VAT)'][1])
# print(excel_data_df['TCS FEE'][2])
