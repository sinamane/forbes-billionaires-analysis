# FORBES BILLIONAIRES EVOLUTION (1997-2024) || SQL + PYTHON + POWER BI
### PROJECT OVERVIEW

---

Forbes is an American business magazine globally recognized for its annual World’s Billionaire list, which ranks individuals by estimated net worth, typically above one billion US dollars. These estimates reflect documented assets and liabilities, offering a snapshot of personal fortunes and broader economic trends.

This project analyses the 2020-2024 billionaire rankings to explore how global wealth evolved in the wake of COVID-19. By focusing on net worth, demographics, and industry trends, the goal is to uncover how different types of billionaires contributed to economic recovery and growth.

### CORE PROJECT QUESTION

---

What types of billionaires drove global economic growth post-COVID, and how can countries foster these industries?

### OBJECTIVE

---

- Web-scrape and impute missing data using Python and the Wikidata API.
- Clean and prepare raw data using SQL Server.
- Analyze global billionaire trends and compare them to South Africa
- Use exploratory data analysis to generate economic insights and recommendations
- Design an interactive Power BI dashboard to visualize findings.

### ABOUT THE DATA

---

The dataset was sourced from the **Forbes Billionaires Evolution (1997-2024)** collection, publicly available on Kaggle. It includes 29 CSV files capturing the financial growth of global billionaires between 1997 and 2024. For this project, I focused on the 2020 to 2024 subset, as these years reflect the post-COVID recovery period.

The dataset is considered credible, aligning closely with the official Forbes site. I manually verified thousands of records during the cleaning and imputation process, particularly while addressing missing data fields like birth dates.

### CHAPTER 1: DATA CLEANING AND WRANGLING

---

The raw data, comprising five separate CSV files from 2020 to 2024, was imported into SQL Server and cleaned individually before being merged into a single consolidated table for analysis. The cleaning and wrangling process prioritized data quality, reusability, and analytical readiness, and involved the following steps:

1. Downloaded and organized annual datasets with consistent naming conventions for easy reference.
2. Used Python (Pandas + Wikidata API) to fill in missing birthdates for 
3. individuals using a programmatic scraping and validation approach.
4. Removed special characters and non-printable symbols from string fields such as `full_name` to ensure consistency and accurate grouping.
5. Standardized all date columns to a long date format and converted textual numeric values to appropriate numeric data types (e.g., `FLOAT`, `INT`).
6. Applied defensive programming techniques using `TRY_CAST` and `TRY_CONVERT` to prevent data ingestion failures from malformed entries.
7. Created analytical views (`vw_billionaire_count_by_country`, `vw_trend_net_worth_by_country`, etc.) to isolate key insights and reduce complexity in reporting tools like Power BI
8. Verified data integrity using record counts, duplicate checks, and cross-year validation to ensure no rows were missed or misaligned during the merge.

### CHAPTER 2: EXPLORATORY DATA ANALYSIS (EDA)

---

After familiarizing myself with the Forbes Billionaire dataset (2020-2024), I developed key business questions to guide analysis. The goal was to uncover trends in global wealth, identify industries and countries driving post-COVID economic recovery, and provided insights into demographic and economic shifts in the billionaire landscape.

I explored the data by:

- Tracking billionaire net worth and industry growth over time
- Analyzing performance across countries, industries, gender, and age groups
- Identifying emerging and declining wealth trends
- Differentiating between inherited and self-made wealth trajectories

The following questions shaped the analysis:

1. Which countries have seen the greatest change in billionaire count and total wealth post-COVID?
2. Which industries have the highest median billionaire net worth, and are they consistent across years?
3. What is the demographic composition (gender, age, self-made status) of new vs. declining billionaires?
4. How can countries like South Africa position themselves based on industry trends and peer comparisons?

### CHAPTER 3: KEY INSIGHTS

---

These findings were derived from cleaned, SQL-transformed data spanning the Forbes 2020–2024 Billionaires list.

1. Change in Billionaire Count and Total Wealth Post-COVID
    - The U.S. and India saw significant growth in both billionaire count and total wealth.
    - Although China’s billionaire count declined, it still achieved the second-highest wealth growth globally, with India close behind.
2. Industries with the Highest Median Net Worth
    - The Finance & Investments and Technology consistently ranked the highest in median net worth from 2020 to 2024.
    - While Finance & Investments held the most wealth, the Manufacturing industry produced the largest number of billionaires, signaling growth in scalable sectors.
3. Demographic Composition of Billionaires
    - There was a notable rise in self-made female billionaires, especially in 2024.
    - Most billionaires remained between the ages of 50-79, and there’s a growing presence of those under 50/
    - The youngest billionaires were predominantly male, except in 2020, when Kylie Jenner held the spot.
4. South African Context
    - South Africa's billionaire class grew modestly from 4 to 6 individuals and families between 2020 and 2024.
    - Their combined net worth increased from $15,4B to $29,4B, showing strong individual gains.
    - These billionaires spanned in key sectors like mining, retail, media, and finance, but wealth remains highly concentrated.

### CHAPTER 4: RECOMMENDATIONS

---

Based on the insights above, here are key strategies that countries and stakeholders could consider to support economic growth through wealth-generating industries.

1. Encourage Growth in High-Contributing Countries

- **India**: Support fast-growing sectors like pharma, fintech, and edtech through infrastructure development and tax incentives.
- **U.S.**: Reinforce dominance in finance and tech by expanding R&D funding and access to venture capital.
- **China**: Despite fewer billionaires, manufacturing wealth grew by 23%—continue building global supply chain partnerships in this sector.

2. Double Down on High-Median-Wealth Industries

- **Finance & Tech**: These industries continue to generate the most billionaire wealth—ideal for targeting investment strategies and wealth management products.
- **Manufacturing**: Its growing billionaire base reflects the scalability of industrial entrepreneurship, especially in emerging markets.

3. Expand Economic Participation

- **Women**: Launch **female founder accelerators**, especially in underrepresented industries like manufacturing, to build on the 2024 rise in self-made women.
- **Youth**: Develop innovation hubs to support billionaires under 30 with seed funding and mentorship programs.

4. South Africa-Specific

- Encourage diversification of wealth creation by supporting scalable entrepreneurship beyond legacy sectors.
- Explore policy incentives to help grow wealth across a broader portion of the population and foster innovation in high-growth industries.

### CHAPTER 5: DASHBOARD

---

![Project_Dashboard_page-0001.jpg](attachment:2520d1e5-7d18-4992-8cf6-bc6390b72384:Project_Dashboard_page-0001.jpg)

### CHAPTER 6: REFLECTIONS

---

- This was my first time sourcing data independently. I learned that data gathering is not just about collection, it requires legal awareness, documentation, and ongoing verification to ensure credibility and usability.
- Although I have a beginner to intermediate with Python, I found that my knowledge of SQL made working with Panda’s more intuitive, thanks to the abundance of resources to translating SQL logic into Python workflows.
- This project deepened my appreciation for SQL’s robustness in handling large datasets. Compared to Excel (used in my previous project), SQL offered more control, reproducibility, and efficiency, especially for cleaning and transforming multi-year data.
- While my last project highlighted the importance of exploratory data analysis (EDA), this experience showed me that data cleaning is even more critical. Without clean and structured data, meaningful analysis simply isn’t possible.

### SUMMARY

---

This project explored global economic growth post-COVID through the lens of Forbes’ 2020-2024 Billionaires dataset. By examining changes in net worth, demographics, and industry performance, I uncovered several patterns:

- A rise in self-made billionaires, particularly among women and younger entrepreneurs
- Persistent gender disparities in wealth accumulation
- Strong wealth concentration in Finance & Investments, Technology, and Manufacturing

Beyond the insights, the projects strengthened my ability to source, clean, and model data end-to-end, laying a solid foundation for backend-focused roles in data and analytics.
