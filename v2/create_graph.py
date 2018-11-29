import pandas as pd
import matplotlib.pyplot as plt

sim_data = pd.read_csv("sample_data.csv")

sim_data.head()

plt.figure()
sim_data.plot()

plt.savefig("plot.pdf", format = "pdf")


