/*
문제 1. 
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
*/
SELECT em1.employee_id,
    em1.first_name,
    de.department_name,
    em2.first_name manager_name
FROM employees em1, employees em2, departments de
WHERE em1.department_id = de.department_id
AND em1.manager_id = em2.employee_id;


/*
문제2.
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되
지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.
//25개국
*/
SELECT region_name,
    country_name
FROM regions re, countries co
WHERE re.region_id = co.region_id
ORDER BY re.region_name DESC,
    co.country_name DESC;
    
    
/*
문제3.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name),
매니저(manager)의 이름(first_name),위치(locations)한 도시(city), 나라(countries)의 이름(countries_name)
그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
//11개
*/
SELECT de.department_id,
    de.department_name,
    em.first_name,
    lo.city,
    co.country_name,
    re.region_name
FROM departments de,
    employees em,
    locations lo,
    countries co,
    regions re
WHERE de.manager_id = em.employee_id
    AND de.location_id = lo.location_id
    AND lo.country_id = co.country_id
    AND co.region_id = re.region_id;
    
    
/*
문제4.
‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.
(현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.)
이름은 first_name과 last_name을 합쳐 출력합니다.
//2명
*/
SELECT em.employee_id,
    em.first_name || ' ' || em.last_name name
FROM employees em, job_history jh, jobs jo
WHERE em.employee_id = jh.employee_id
    AND jh.job_id = jo.job_id
    AND jo.job_title = 'Public Accountant'
    AND jh.end_date < SYSDATE;
    
    
/*
문제5.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과
부서 이름을 조회하여 성(last_name)순서로 오름차순 정렬하세요.
//106명
*/
SELECT em.employee_id,
    em.first_name,
    em.last_name,
    de.department_name
FROM employees em, departments de
WHERE em.department_id = de.department_id
ORDER BY em.last_name ASC;


/*
문제6.
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id),
성(last_name)과 채용일(hire_date)을 조회하세요.
*/
SELECT em.employee_id,
    em.last_name,
    em.hire_date
FROM employees em, employees ma
WHERE em.manager_id = ma.employee_id
    AND em.hire_date < ma.hire_date;