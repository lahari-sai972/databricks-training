-- Q1
-- Extract numeric characters at the beginning
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '^[0-9]+')
FROM regex_practice;

-- Q2
-- Extract numeric characters at the end
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[0-9]+$')
FROM regex_practice;

-- Q3
-- Extract first single character
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '^.')
FROM regex_practice;

-- Q4
-- Extract last single character
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '.$')
FROM regex_practice;

-- Q5
-- Extract exactly two consecutive numeric characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[0-9]{2}')
FROM regex_practice;

-- Q6
-- Extract exactly one numeric character
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[0-9]')
FROM regex_practice;

-- Q7
-- Extract country code from phone number
SELECT phone,
REGEXP_SUBSTR(phone, '[0-9]+')
FROM regex_practice;

-- Q8
-- Extract numeric portion between alphabetic characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[0-9]+')
FROM regex_practice;

-- Q9
-- Extract text before @ symbol
SELECT email,
REGEXP_SUBSTR(email, '^[^@]+')
FROM regex_practice;

-- Q10
-- Extract text after @ symbol
SELECT email,
REGEXP_SUBSTR(email, '(?<=@).*')
FROM regex_practice;

-- Q11
-- Extract domain name without @
SELECT email,
REGEXP_SUBSTR(email, '[^@]+$')
FROM regex_practice;

-- Q12
-- Extract text after last dot
SELECT email,
REGEXP_SUBSTR(email, '[^.]+$')
FROM regex_practice;

-- Q13
-- Extract continuous alphabetic characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[A-Za-z]+')
FROM regex_practice;

-- Q14
-- Extract continuous numeric characters
SELECT mixed_value,
REGEXP_SUBSTR(mixed_value, '[0-9]+')
FROM regex_practice;

-- Q15
-- Extract first three characters from full_text
SELECT full_text,
REGEXP_SUBSTR(full_text, '^...')
FROM regex_practice;

-- Q16
-- Extract last two characters from full_text
SELECT full_text,
REGEXP_SUBSTR(full_text, '..$')
FROM regex_practice;

-- Q17
-- Extract employee number between prefix and underscore
SELECT full_text,
REGEXP_SUBSTR(full_text, '[0-9]+')
FROM regex_practice;

-- Q18
-- Extract country code at end of full_text
SELECT full_text,
REGEXP_SUBSTR(full_text, '[A-Z0-9]+$')
FROM regex_practice;

-- Q19
-- Extract alphabetic text between underscores
SELECT full_text,
REGEXP_SUBSTR(full_text, '(?<=_)[A-Za-z]+(?=_)')
FROM regex_practice;

-- Q20
-- Extract digits immediately after plus sign
SELECT phone,
REGEXP_SUBSTR(phone, '(?<=\\+)[0-9]+')
FROM regex_practice;
