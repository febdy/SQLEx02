/*
문제 1. 
직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요.
두 임금의 차이는 얼마인가요?
“최고임금 – 최저임금”이란 타이틀로 함께 출력해 보세요.
*/
SELECT MAX(salary) "최고임금",
    MIN(salary) "최저임금",
    MAX(salary) - MIN(salary) "최고임금 - 최저임금"
FROM employees;


/*
문제2.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
SELECT TO_CHAR(MAX(hire_date), 'YYYY"년" MM"월" DD"일"') "Latest Hire Date"
FROM employees;


/*
문제3.
부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력하고
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
SELECT department_id,
    AVG(salary) "평균임금",
    MAX(salary) "최고임금",
    MIN(salary) "최저임금"
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;


/*
문제4.
업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무(job_id)와 함께 출력하고
정렬순서는 업무(job_id) 내림차순입니다.
*/
SELECT job_id,
    AVG(salary) "평균임금",
    MAX(salary) "최고임금",
    MIN(salary) "최저임금"
FROM employees
GROUP BY job_id
ORDER BY job_id DESC;


/*
문제5.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
SELECT TO_CHAR(MIN(hire_date), 'YYYY"년" MM"월" DD"일"') "LONGEST_HIRE_DATE"
FROM employees;


/*
문제6.
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금
그리고 (평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
SELECT department_id,
    AVG(salary) "평균임금",
    MIN(salary) "최저임금",
    AVG(salary) - MIN(salary) "평균임금 - 최저임금"
FROM employees
GROUP BY department_id
HAVING AVG(salary) - MIN(salary) < 2000
ORDER BY "평균임금 - 최저임금" DESC;


/*
문제7.
업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
차이를 확인할 수 있도록 내림차순으로 정렬하세요.
*/
SELECT job_id,
    MAX(salary) - MIN(salary) "최고-최저 차이"
FROM employees
GROUP BY job_id
ORDER BY "최고-최저 차이" DESC;