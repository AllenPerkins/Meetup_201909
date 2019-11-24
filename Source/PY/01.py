import pandas as pd
import matplotlib.pyplot as plt
fruits = pd.read_table('fruit.txt')
fruits.head()
import seaborn as sns

sns.countplot(fruits['fruit_name'],label="Count")
b = plt.figure(1)
# plt.show()
# print(fruits)

fruits.drop('fruit_label', axis=1).plot(kind='box', subplots=True, 
  layout=(2,2), sharex=False, sharey=False, figsize=(9,9), 
  title='Box Plot for each input variable')
# plt.savefig('fruits_box')
x = plt.figure(2)
# plt.show()
b.show()
x.show()

print(fruits)
fruits.describe()
# fruits.describe(include='all')
S = fruits.describe()
type(S)
