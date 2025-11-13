# 📘 Student Management System (MVC)

### STUDENT INFORMATION:
**Name:** Phan Tran Anh Quan  
**Student ID:** ITITIU23019  
**Class:** Web Application Development G01_lab3 (Tue-1234)

---

## COMPLETED EXERCISES:
- [x] Exercise 5: Search  
- [x] Exercise 6: Validation  
- [x] Exercise 7: Sorting & Filtering  
- [X] Exercise 8: Pagination  
- [ ] Bonus 1: Export Excel  

---

## MVC COMPONENTS:
- Model: `Student.java`  
- DAO: `StudentDAO.java`  
- Controller: `StudentController.java`  
- Views: `student-list.jsp`, `student-form.jsp`

---

## FEATURES IMPLEMENTED:
- All CRUD operations  
- Search functionality  
- Server-side validation  
- Sorting by columns  
- Filter by major  

---

## ⚠️ KNOWN ISSUES:
- When validation fails in **Add** or **Edit** form (e.g., wrong email format), the form reloads but:
  - The page incorrectly switches to **Edit Student** mode even during Add operation.
  - The **student code field becomes empty or becomes read-only**, forcing retyping and will cause error.
  - This happens because after validation failure, the controller always sets a `student` attribute, causing `${student != null}` in JSP to trigger Edit mode.

---

## EXTRA FEATURES:
- *(List any bonus features here)*

---

## TIME SPENT:
**7 hours**
