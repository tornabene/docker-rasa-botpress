import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
 
df = pd.read_excel('FileDominus.xlsx', sheetname='Foglio2')
 
print("Column headings:")
print(df.columns)

for i in df.index:
    print(df[df.columns[0]][i])
