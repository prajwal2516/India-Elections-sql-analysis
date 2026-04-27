-- =========================================
-- INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024
-- =========================================

-- 1. Total Seats
SELECT COUNT(DISTINCT Parliament_Constituency) AS Total_Seats
FROM constituencywise_results;


-- 2. Total seats available in each state
SELECT 
    s.State AS State_Name,
    COUNT(cr.Constituency_ID) AS Total_Seats_Available
FROM constituencywise_results cr
JOIN statewise_results sr 
    ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s 
    ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;


-- 3. Total Seats Won by NDA Alliance
SELECT 
    SUM(CASE 
        WHEN party IN (
            'Bharatiya Janata Party - BJP', 
            'Telugu Desam - TDP', 
            'Janata Dal (United) - JD(U)',
            'Shiv Sena - SHS', 
            'AJSU Party - AJSUP', 
            'Apna Dal (Soneylal) - ADAL', 
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS', 
            'Janasena Party - JnP', 
            'Janata Dal (Secular) - JD(S)',
            'Lok Janshakti Party (Ram Vilas) - LJPRV', 
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD', 
            'Sikkim Krantikari Morcha - SKM'
        ) THEN Won ELSE 0 
    END) AS NDA_Total_Seats_Won
FROM partywise_results;


-- 4. Seats Won by NDA Parties
SELECT 
    party AS Party_Name,
    won AS Seats_Won
FROM partywise_results
WHERE party IN (
    'Bharatiya Janata Party - BJP', 
    'Telugu Desam - TDP', 
    'Janata Dal (United) - JD(U)',
    'Shiv Sena - SHS', 
    'AJSU Party - AJSUP', 
    'Apna Dal (Soneylal) - ADAL', 
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS', 
    'Janasena Party - JnP', 
    'Janata Dal (Secular) - JD(S)',
    'Lok Janshakti Party (Ram Vilas) - LJPRV', 
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD', 
    'Sikkim Krantikari Morcha - SKM'
)
ORDER BY Seats_Won DESC;


-- 5. Total Seats Won by INDIA Alliance
SELECT 
    SUM(CASE 
        WHEN party IN (
            'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India (Marxist) - CPI(M)',
            'Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
            'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
            'Viduthalai Chiruthaigal Katchi - VCK'
        ) THEN Won ELSE 0 
    END) AS INDIA_Total_Seats_Won
FROM partywise_results;


-- 6. Seats Won by INDIA Alliance Parties
SELECT 
    party AS Party_Name,
    won AS Seats_Won
FROM partywise_results
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India (Marxist) - CPI(M)',
    'Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
)
ORDER BY Seats_Won DESC;


-- 7. Add Alliance Column
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);


-- 8. Update Alliance = INDIA
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India (Marxist) - CPI(M)',
    'Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);


-- 9. Update Alliance = NDA
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal (Secular) - JD(S)',
    'Lok Janshakti Party (Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);


-- 10. Update Remaining = OTHER
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


-- 11. Alliance Winning Most Seats
SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p 
    ON cr.Party_ID = p.Party_ID
GROUP BY p.party_alliance
ORDER BY Seats_Won DESC;


-- 12. Winning Candidate Details
SELECT 
    cr.Winning_Candidate, 
    p.Party, 
    p.party_alliance, 
    cr.Total_Votes, 
    cr.Margin, 
    cr.Constituency_Name, 
    s.State
FROM constituencywise_results cr
JOIN partywise_results p 
    ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr 
    ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s 
    ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' 
AND cr.Constituency_Name = 'AMETHI';


-- 13. EVM vs Postal Votes
SELECT 
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
FROM constituencywise_details cd
JOIN constituencywise_results cr 
    ON cd.Constituency_ID = cr.Constituency_ID
WHERE cr.Constituency_Name = 'MATHURA'
ORDER BY cd.Total_Votes DESC;


-- 14. Party Performance in a State
SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p 
    ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr 
    ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s 
    ON sr.State_ID = s.State_ID
WHERE s.State = 'Andhra Pradesh'
GROUP BY p.Party
ORDER BY Seats_Won DESC;


-- 15. Alliance Seats by State
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p 
    ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr 
    ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s 
    ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;


-- 16. Top 10 Candidates by EVM Votes
SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr 
    ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (
    SELECT MAX(cd1.EVM_Votes)
    FROM constituencywise_details cd1
    WHERE cd1.Constituency_ID = cd.Constituency_ID
)
ORDER BY cd.EVM_Votes DESC;


-- 17. Winning & Runner-up Candidates (Maharashtra)
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        ROW_NUMBER() OVER (
            PARTITION BY cd.Constituency_ID 
            ORDER BY (cd.EVM_Votes + cd.Postal_Votes) DESC
        ) AS VoteRank
    FROM constituencywise_details cd
    JOIN constituencywise_results cr 
        ON cd.Constituency_ID = cr.Constituency_ID
    JOIN statewise_results sr 
        ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN states s 
        ON sr.State_ID = s.State_ID
    WHERE s.State = 'Maharashtra'
)
SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM RankedCandidates rc
JOIN constituencywise_results cr 
    ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY cr.Constituency_Name
ORDER BY cr.Constituency_Name;


-- 18. Maharashtra Summary Stats
SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results cr
JOIN constituencywise_details cd 
    ON cr.Constituency_ID = cd.Constituency_ID
JOIN statewise_results sr 
    ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s 
    ON sr.State_ID = s.State_ID
JOIN partywise_results p 
    ON cr.Party_ID = p.Party_ID
WHERE s.State = 'Maharashtra';