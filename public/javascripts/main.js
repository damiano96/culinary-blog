//dodawanie nowych przepisow
let v = 2;
function addComponents() {
    let s = '<div class="row">\n' +
        '<div class="col-sm-7"><input type="text" class="form-control" name="skladnik' + v +'" placeholder="Nazwa" required></div>\n' +
        '<div class="col-sm-5"><input type="number" class="form-control" name="skladnik' + v +'" placeholder="Ilość (gramy)" required></div>\n' +
        '</div>';
    document.getElementById('skladniki-form').innerHTML += s;
    document.getElementById('liczbaSkladnikow').value = v;
    v++;
}

$('#zdjecie').on('change',function() {
    let fileName = $(this).val();
    $(this).next('.custom-file-label').html(fileName);
});


//tabelka admninistrator
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
    $("#myInput").on("keyup", function() {
        let value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});

//wykres administrator
let datas = [];
let label = [];
let xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
        let myObj = JSON.parse(this.responseText);
        for(let i=0; i<myObj.length; i++) {
            datas.push(myObj[i].ilosc);
            label.push(myObj[i].nazwa_kategorii);

        }
        chart();
    }
};
xhttp.open("POST", '/admin/json/chart', true);
xhttp.send();


function chart() {
    var ctx = document.getElementById("myChart").getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            datasets: [{
                data: datas,
                backgroundColor: [
                    'rgba(26,188,156 ,1)',
                    'rgba(46,204,113 ,1)',
                    'rgba(52,152,219 ,1)',
                    'rgba(155,89,182 ,1)',
                    'rgba(192,57,43  ,1)',
                    'rgba(241,196,15 ,1)'
                ],
                
            }],
            labels: label
        },
        options: {
            responsive: true,
            legend: {
                display: false
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            scales: {
                yAxes: [{
                    ticks: {
                        max: 5,
                        min: 0,
                        stepSize: 1
                    }
                }]
            }
        }
    });
}