# IPL-Cricket-Performance-Dashboard
End-to-end IPL analytics pipeline using Python (Google Colab), SQL (SQLite) and Power BI — covering data cleaning, feature engineering, SQL queries and interactive dashboard.
# 🏏 IPL Cricket Performance Dashboard (2008–2023)

An end-to-end data analytics project analyzing 16 seasons of IPL cricket data
using Python, SQL and Power BI.

---

## 📊 Dashboard Preview

<img width="1106" height="628" alt="2_Batting Stats" src="https://github.com/user-attachments/assets/7c9aa5dd-5724-4a88-ae88-80e8e0da7ac1" />
<img width="1106" height="622" alt="3_Bowling Stats" src="https://github.com/user-attachments/assets/1ef8f0b9-dbef-4dce-bbd9-d31912f463b0" />
<img width="1107" height="623" alt="4_Team   Toss" src="https://github.com/user-attachments/assets/df4ad3af-38ca-4a0c-b25f-bef1efe0345b" />
<img width="1102" height="618" alt="5_Venue   Awards" src="https://github.com/user-attachments/assets/306f611d-aab9-41ab-a723-289177b33998" />



---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| Google Colab (Python + Pandas) | Data cleaning, feature engineering, export to SQLite |
| SQLite | Database storage and business query writing |
| Power BI Desktop | Interactive 5-page dashboard |

---

## 📁 Project Structure

IPL-Cricket-Performance-Dashboard/

├── data/               → Raw CSV files (matches + deliveries)

├── notebooks/          → Google Colab notebook (Phase 1)

├── sql/                → All 8 SQL business queries

├── exports/            → Cleaned CSV outputs from SQL queries

├── powerbi/            → Power BI .pbix dashboard file

├── screenshots/        → Dashboard page screenshots

└── README.md

## 🔄 Project Pipeline

Raw CSV Data

↓

Google Colab — Clean, transform, engineer features

↓

SQLite Database — Store 5 tables, write 8 business queries

↓

Power BI — 5-page interactive dashboard

---

## 📌 Key Insights from the Data

- **V Kohli** is the all-time leading run scorer in IPL history
- **DJ Bravo** leads the all-time wicket takers chart
- **63.68%** of toss winners chose to field first — chasing is heavily preferred
- **AD Russell** has the highest career strike rate among qualified batters
- **Sawai Mansingh Stadium (Jaipur)** is the best venue for chasing teams
- **AB de Villiers** leads all-time Player of the Match awards

---

## 📄 Dashboard Pages

| Page | Visuals |
|---|---|
| Home | Project title and author |
| Batting Stats | Top run scorers, best strike rates, KPI cards |
| Bowling Stats | Top wicket takers, best economy, scatter plot |
| Team & Toss | Win % by season, toss impact analysis, season slicer |
| Venue & Awards | Best chasing venues, Player of the Match treemap |

---

## 🚀 How to Run This Project

### Phase 1 — Google Colab
1. Open `notebooks/IPL_Phase1_DataCleaning.ipynb` in Google Colab
2. Upload `data/matches.csv` and `data/deliveries.csv`
3. Run all cells — exports `ipl_database.db`

### Phase 2 — SQL
1. Open `sql/ipl_queries.sql` in DB Browser for SQLite or run via Python
2. Connect to `ipl_database.db`
3. Run each query to explore the data

### Phase 3 — Power BI
1. Open `powerbi/IPL_Performance_Dashboard_2008_2023.pbix` in Power BI Desktop
2. If prompted, update the data source path to your local `exports/` folder
3. Explore all 5 pages

---

## 📦 Dataset

- Source: [IPL Men's Cricket Matches Data 2008–2023](https://www.kaggle.com/datasets/utkarshtomar736/ipl-mens-cricket-matches-data-2008-2023)
- Records: 1,024 matches | 243,817 ball-by-ball deliveries
- Seasons: 2008 to 2023 (16 seasons)

---

## 👤 Author

**Prithviraj Shukla**
- GitHub: [@prithviraj-shukla](https://github.com/prithviraj-shukla)

---

## 📃 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
