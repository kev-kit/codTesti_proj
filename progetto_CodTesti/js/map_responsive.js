
var mapList = document.getElementsByTagName('map');

function change_coords()
{

    // console.log('CHIAMATA COORDS');
    
    for( i=0; i < mapList.length; i++)
    {
        img = mapList[i].previousSibling;
        imgProp = img.getAttribute('itemprop');
        
        widthOR = imgProp.substring(0, 4);
        heightOR = imgProp.substring(5, imgProp.length);

        widthRE = img.width;
        heightRE = img.height;

        // console.log('original', widthOR, heightOR);
        // console.log(widthRE, heightRE);

        areaList = mapList[i].getElementsByTagName('area');

        for(j=0; j < areaList.length; j++)
        {
            str = "";
            coords = areaList[j].getAttribute('coords');

            // console.log('prima', areaList[j].getAttribute('coords'));

            if(areaList[j].getAttribute('shape') == 'rect')
            {
                coordsList = coords.split(",");
                ulx = coordsList[0];
                uly = coordsList[1];
                lrx = coordsList[2];
                lry = coordsList[3];
                // console.log(ulx, uly, lrx, lry);

                /* proporzione e valore relativo */
                ulx = Math.round((ulx*widthRE)/widthOR);
                uly = Math.round((uly*heightRE)/heightOR);
                lrx = Math.round((lrx*widthRE)/widthOR);
                lry = Math.round((lry*heightRE)/heightOR);
                // console.log('nuove= ', ulx, uly, lrx, lry);

                str = ulx + ", " + uly + ", " + lrx + ", " + lry;   // nuova stringa di coords
                // console.log('str', str);

                // console.log(str);
            }
            else
            {
                coordsList = coords.split(' ');
                //console.log(coordsList);    
                
                for(k=0; k<coordsList.length; k++)
                    coordsList[k] = coordsList[k].split(",");

                for(k=0; k<coordsList.length; k++)
                {
                    coordsList[k][0] = Math.round((coordsList[k][0]*widthRE)/widthOR);
                    coordsList[k][1] = Math.round((coordsList[k][1]*heightRE)/heightOR);

                    if(k == coordsList.length-1)
                        str += coordsList[k][0] + ',' + coordsList[k][1];
                    else
                        str += coordsList[k][0] + ',' + coordsList[k][1] + ', ';    // nuova stringa di coords
                }

                // console.log(str);
            }

            areaList[j].setAttribute('coords', str);
            //console.log("dopo", areaList[j].getAttribute('coords'));
        }
    }

}

window.addEventListener('resize', change_coords);

// la FUNZIONE DEVE ESSERE CHIAMATA OGNI CAMBIO DI FRONTE/RETRO or PG

function init()
{
    change_coords();

    /*
        PROBLEMA
        dopo il primo window.resize si presenta un errore in quanto i valori delle coordinate vengono ricalcolati 
        non su il valore originale (indicato in cod. TEI) ma sul valore relativo ottenuto dal calcolo del primo 
        window.resize.
        Sistemabile passando i valori delle coordinate originarie (cod. TEI) in un attributo come 'itemprop' sui quali
        ricalcolare ogni volta i valori relativi delle coordinate.
    */

    document.getElementById('toGC').onclick = 
        function(){ 
            show_GC();  // da cartoline.js
            change_coords(); 
            }
    document.getElementById('toOT').onclick = 
        function(){ 
            show_OT();  // da cartoline.js
            change_coords(); 
            }

    document.getElementsByClassName('bt')[0].onclick = 
        function(){ 
            show_fronte(); // da cartoline.js
            change_coords(); 
        }
    document.getElementsByClassName('bt')[1].onclick = 
        function(){ 
            show_retro(); // da cartoline.js
            change_coords(); }
    document.getElementsByClassName('bt')[2].onclick = 
        function(){
            show_fronte(); // da cartoline.js
            change_coords(); 
            }
    document.getElementsByClassName('bt')[3].onclick = 
        function(){ 
            show_retro(); // da cartoline.js
            change_coords(); 
            }

}

document.onload = init();