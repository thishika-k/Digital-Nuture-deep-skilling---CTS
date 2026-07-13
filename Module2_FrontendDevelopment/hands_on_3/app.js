import { courses } from "./data.js";

const courseContainer = document.getElementById("courseContainer");
const totalCourses = document.getElementById("totalCourses");
const totalCredits = document.getElementById("totalCredits");
const highestCredits = document.getElementById("highestCredits");

const searchBox = document.getElementById("searchBox");
const sortCourses = document.getElementById("sortCourses");

let courseList = [...courses];

/* ===========================
   Dashboard
=========================== */

function updateDashboard() {

    totalCourses.textContent = courseList.length;

    const total = courseList.reduce(
        (sum, course) => sum + course.credits,
        0
    );

    totalCredits.textContent = total;

    const highest = Math.max(
        ...courseList.map(course => course.credits)
    );

    highestCredits.textContent = highest;
}

/* ===========================
   Render Courses
=========================== */

function renderCourses(list) {

    courseContainer.innerHTML = "";

    if (list.length === 0) {

        courseContainer.innerHTML =
            "<p>No courses found.</p>";

        return;
    }

    list.forEach(course => {

        const card = document.createElement("article");

        card.className = "course-card";

        card.innerHTML = `

            <h3>${course.name}</h3>

            <p><strong>Instructor:</strong> ${course.instructor}</p>

            <p><strong>Duration:</strong> ${course.duration}</p>

            <span class="credit">
                ${course.credits} Credits
            </span>

            <button data-id="${course.id}">
                ${course.enrolled ? "Enrolled ✅" : "Enroll"}
            </button>

        `;

        courseContainer.appendChild(card);

    });

}

/* ===========================
   Search
=========================== */

searchBox.addEventListener("input", () => {

    const keyword = searchBox.value.toLowerCase();

    const filtered = courseList.filter(course =>

        course.name.toLowerCase().includes(keyword)

    );

    renderCourses(filtered);

});

/* ===========================
   Sort
=========================== */

sortCourses.addEventListener("change", () => {

    let sorted = [...courseList];

    if (sortCourses.value === "asc") {

        sorted.sort((a, b) =>
            a.name.localeCompare(b.name)
        );

    }

    else if (sortCourses.value === "desc") {

        sorted.sort((a, b) =>
            b.name.localeCompare(a.name)
        );

    }

    renderCourses(sorted);

});

/* ===========================
   Event Delegation
=========================== */

courseContainer.addEventListener("click", (event) => {

    if (!event.target.matches("button"))
        return;

    const id = Number(event.target.dataset.id);

    const course = courseList.find(c => c.id === id);

    course.enrolled = !course.enrolled;

    renderCourses(courseList);

});

/* ===========================
   Initial Load
=========================== */

updateDashboard();

renderCourses(courseList);


/* ===========================
You have now implemented:

✅ ES6 Modules (import / export)
✅ Arrow Functions
✅ map()
✅ filter()
✅ reduce()
✅ find()
✅ Spread Operator (...)
✅ Template Literals
✅ Dynamic DOM Manipulation
✅ Event Listeners
✅ Event Delegation
✅ Search
✅ Sorting
✅ Interactive UI*/ 