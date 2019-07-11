
function show_GC(){
    document.getElementById('GC').style.display = "block"; 
    document.getElementById('OT').style.display = "none";
    show_fronte();
}

function show_OT(){
    document.getElementById('OT').style.display = "block"; 
    document.getElementById('GC').style.display = "none";
    show_fronte();
}

function show_fronte(){
    for(i=0; i < document.getElementsByClassName('retro').length; i++)
        document.getElementsByClassName('retro')[i].style.display = "none";

    for(i=0; i < document.getElementsByClassName('fronte').length; i++)
        document.getElementsByClassName('fronte')[i].style.display = "block";

    colorBt(document.getElementsByClassName('bt_fronte'), document.getElementsByClassName('bt_retro'));
}

function show_retro(){
    for(i=0; i < document.getElementsByClassName('fronte').length; i++)
        document.getElementsByClassName('fronte')[i].style.display = "none";
    
    for(i=0; i < document.getElementsByClassName('retro').length; i++)
        document.getElementsByClassName('retro')[i].style.display = "block";

    colorBt(document.getElementsByClassName('bt_retro'), document.getElementsByClassName('bt_fronte'));
}

function colorBt(x, y){
    for(i=0; i < x.length; i++)
        x[i].style.border = "3px solid rgb(98, 164, 196)";

    for(i=0; i < y.length; i++)
        y[i].style.border = "3px solid gray";
}

function ev_li(a)
{
    id = a.getAttribute('id');
    id = id.toString(); 

    if(id.match(/stamp/))   // riferimenti di stampa
        a.style.backgroundColor='rgb(222, 80, 80)'; 
    else
        a.style.backgroundColor='rgb(96, 152, 196)';   
}

function no_li(a)
{
    a.style.backgroundColor='transparent';   
}