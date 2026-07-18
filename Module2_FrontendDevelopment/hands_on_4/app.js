const studentContainer = document.getElementById("studentContainer");
const studentCount = document.getElementById("studentCount");

const loadButton = document.getElementById("loadStudents");
const refreshButton = document.getElementById("refreshStudents");
const searchBox = document.getElementById("searchBox");

let students = [];

/* ==========================
   Display Students
========================== */

function displayStudents(studentList){

    studentContainer.innerHTML="";

    studentCount.textContent=studentList.length;

    if(studentList.length===0){

        studentContainer.innerHTML=
        `<p class="error">No students found.</p>`;

        return;
    }

    studentList.forEach(student=>{

        const card=document.createElement("div");

        card.className="student-card";

        card.innerHTML=`

            <h3>${student.name}</h3>

            <p><strong>Email:</strong> ${student.email}</p>

            <p><strong>Phone:</strong> ${student.phone}</p>

            <p><strong>Company:</strong> ${student.company.name}</p>

        `;

        studentContainer.appendChild(card);

    });

}

/* ==========================
   Fetch API
========================== */

async function loadStudents(){

    try{

        studentContainer.innerHTML=
        `<p class="loading">Loading Students...</p>`;

        const response=await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );

        if(!response.ok){

            throw new Error("Unable to fetch data.");

        }

        students=await response.json();

        displayStudents(students);

    }

    catch(error){

        studentContainer.innerHTML=
        `<p class="error">${error.message}</p>`;

    }

}

/* ==========================
   Search
========================== */

searchBox.addEventListener("input",()=>{

    const keyword=searchBox.value.toLowerCase();

    const filtered=students.filter(student=>

        student.name.toLowerCase().includes(keyword)

    );

    displayStudents(filtered);

});

/* ==========================
   Refresh
========================== */

refreshButton.addEventListener("click",()=>{

    searchBox.value="";

    loadStudents();

});

/* ==========================
   Load Button
========================== */

loadButton.addEventListener("click",loadStudents);

/* ==========================
   Auto Load
========================== */

loadStudents();