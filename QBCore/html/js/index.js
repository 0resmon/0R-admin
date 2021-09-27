$("body").css("display","none"); 
var state = "main";
var last_player_id = 1;
var lockbackspace = false;
var stateL = {
	main: 6,
	cur_main: 1,
	playerlist: 0,
	cur_playerlist: 1,
	playerlist_alt: 17,
	cur_playerlist_alt: 1,
	input: null,
	serversettings: 15,
	cur_serversettings: 1,
	devtools: 11,
	cur_devtools: 1,
	bans: 1,
	cur_bans: 1,
}

var databox = {
	last_item: "",
	last_item_count: 0,
	last_job: "",
	last_job_grade: "",
	clock: 1,
	min: 1,
	ban_identifier: "",
}

 
ChangeItem = (x) => {
  
  switch(x) {
	case "up":
	 if(state == "main") {
	  for (let i = 1; i < stateL.main; i++) {
 
		  if($("#1_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#1_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#1_"+i).addClass("selected") 
			 stateL.cur_main = i;
		  }
 
		} 
      }
	  
     if(state == "playerlist") {
	  for (let i = 1; i < stateL.playerlist; i++) {
 
		  if($("#1_2_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#1_2_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#1_2_"+i).addClass("selected") 
			 stateL.cur_playerlist = i;
		  }
 
		} 
      }
	  
	  if(state == "bans") {
	  for (let i = 1; i < stateL.bans; i++) {
 
		  if($("#4_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#4_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#4_"+i).addClass("selected") 
			 stateL.cur_bans = i;
		  }
 
		} 
      }
	  
		
	if(state == "playerlist_alt") {
	  for (let i = 1; i < stateL.playerlist_alt; i++) {
 
		  if($("#1_3_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#1_3_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#1_3_"+i).addClass("selected") 
			 stateL.cur_playerlist_alt = i;
		  }
 
		} 
      }
   
   
   if(state == "serversettings") {
	  for (let i = 1; i < stateL.serversettings; i++) {
 
		  if($("#2_1_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#2_1_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#2_1_"+i).addClass("selected") 
			 stateL.cur_serversettings = i;
		  }
 
		} 
      }
	  
	  if(state == "devtools") {
	  for (let i = 1; i < stateL.devtools; i++) {
 
		  if($("#3_1_"+i).attr('class') == "list-item selected") {
			
		 
			 $("#3_1_"+i).removeClass("selected");
			 if(i != 1)  {
			 i = i - 1;
			 }
			 $("#3_1_"+i).addClass("selected") 
			 stateL.cur_devtools = i;
		  }
 
		} 
      }
	 break;
	case "down":
	 if(state == "main") {
		
		for (let i = 1; i < stateL.main; i++) {
           
		   
		  if($("#1_"+i).attr('class') == "list-item selected") {
             
			 $("#1_"+i).removeClass("selected");
			 if(i != 5) {
			  i = i + 1;
			  }
			 $("#1_"+i).addClass("selected") 
			 stateL.cur_main = i;
			 
		  }
		    
           
		} 

		
	 }
	 
	  if(state == "bans") {
	   
        for (let i = 1; i < stateL.bans; i++) {
          
		  if($("#4_"+i).attr('class') == "list-item selected") {
             
			 $("#4_"+i).removeClass("selected");
			 
			 if(i != stateL.bans - 1) {
			  i = i + 1;
			 }
 
			 $("#4_"+i).addClass("selected");
			 stateL.cur_bans = i;
			 
			 
			 
		  }
		    
           
		}		
		 
     }
	 
	  
	 if(state == "playerlist") {
	   
        for (let i = 1; i < stateL.playerlist; i++) {
          
		  if($("#1_2_"+i).attr('class') == "list-item selected") {
             
			 $("#1_2_"+i).removeClass("selected");
			 
			 if(i != stateL.playerlist - 1) {
			  i = i + 1;
			 }
 
			 $("#1_2_"+i).addClass("selected");
			 stateL.cur_playerlist = i;
			 
			 
			 
		  }
		    
           
		}		
		 
     }
	 

     if(state == "playerlist_alt") {
	   
        for (let i = 1; i < stateL.playerlist_alt; i++) {
          
		  if($("#1_3_"+i).attr('class') == "list-item selected") {
             
			 $("#1_3_"+i).removeClass("selected");
			 
			 if(i != stateL.playerlist_alt - 1) {
			  i = i + 1;
			 }
 
			 $("#1_3_"+i).addClass("selected");
			 stateL.cur_playerlist_alt = i;
			 
			 
			 
		  }
		    
           
		}		
		 
     }	 
	 
	 if(state == "serversettings") {
	   
        for (let i = 1; i < stateL.serversettings; i++) {
          
		  if($("#2_1_"+i).attr('class') == "list-item selected") {
             
			 $("#2_1_"+i).removeClass("selected");
			 
			 if(i != stateL.serversettings - 1) {
			  i = i + 1;
			 }
 
			 $("#2_1_"+i).addClass("selected");
			 stateL.cur_serversettings = i;
 
		  }
 
		}		
		 
     }	
	 
	 if(state == "devtools") {
	   
        for (let i = 1; i < stateL.devtools; i++) {
          
		  if($("#3_1_"+i).attr('class') == "list-item selected") {
             
			 $("#3_1_"+i).removeClass("selected");
			 
			 if(i != stateL.devtools - 1) {
			  i = i + 1;
			 }
 
			 $("#3_1_"+i).addClass("selected");
			 stateL.cur_devtools = i;
 
		  }
 
		}		
		 
     }
	 
	 
	 break;
	 
	 
  }
     
	
}

var blipbool = false;

Enter = () => {
	if(stateL.input) {
	   
	   switch(stateL.input) {	
	      case "kick": 
		  $.post('https://0R-admin/Kick', JSON.stringify({id: last_player_id, reason: $(".databox").val() }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
          case "givecar": 
		  $.post('https://0R-admin/GiveCar', JSON.stringify({id: last_player_id, carmodel: $(".databox").val() }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "givecarown": 
		  $.post('https://0R-admin/GiveCar', JSON.stringify({id: last_player_id, carmodel: $(".databox").val(), own: true }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "giveitem2": 
		  databox.last_item_count = $(".databox").val();
		  $.post('https://0R-admin/GiveItem', JSON.stringify({id: last_player_id, item: databox.last_item, count: databox.last_item_count }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html("");  databox.last_item_count = 0; databox.last_item = "";  }, 200);
		  break;
		  case "giveitem1": 
		  databox.last_item = $(".databox").val();
		  $(".inputs").css("display","none"); $(".inputs").html("");
		  setTimeout(function(){
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Count" data-type="itemname" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "giveitem2";
		   }, 200);
		  break;
		  case "job2": 
		  databox.last_job_grade = $(".databox").val();
		  $.post('https://0R-admin/SetJob', JSON.stringify({id: last_player_id, job: databox.last_job, grade: databox.last_job_grade }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html("");  databox.last_job_grade = 0; databox.last_job = "";  }, 200);
		  break;
		  case "job1": 
		  databox.last_job = $(".databox").val();
		  $(".inputs").css("display","none"); $(".inputs").html("");
		  setTimeout(function(){
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Job grade" data-type="itemname" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "job2";
		   }, 200);
		  break;
		  case "clock2": 
		  databox.min = $(".databox").val();
		  $.post('https://0R-admin/SetTime', JSON.stringify({id: last_player_id, clock: databox.clock, min: databox.min, type: "set" }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html("");  databox.clock = 1; databox.min = 1;  }, 200);
		  break;
		  case "clock1": 
		  databox.clock = $(".databox").val();
		  $(".inputs").css("display","none"); $(".inputs").html("");
		  setTimeout(function(){
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Minute" data-type="itemname" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "clock2";
		   }, 200);
		  break;
		  case "weather": 
		  $.post('https://0R-admin/SetWeather', JSON.stringify({id: last_player_id, weather: $(".databox").val(), type: "set" }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "Announcement": 
		  $.post('https://0R-admin/Announcement', JSON.stringify({ text: $(".databox").val() }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "kickall": 
		  $.post('https://0R-admin/KickAll', JSON.stringify({  reason: $(".databox").val() }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "wipeoffline": 
		  $.post('https://0R-admin/WipePlayerOffline', JSON.stringify({  identifier: $(".databox").val() }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); }, 200);
		  break;
		  case "banoffline2": 
		  $.post('https://0R-admin/BanPlayerOffline', JSON.stringify({  identifier: databox.ban_identifier, reason: $(".databox").val()  }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html(""); databox.ban_identifier = "" }, 200);
		  break;
		  case "banoffline1": 
		  databox.ban_identifier = $(".databox").val();
		  $(".inputs").css("display","none"); $(".inputs").html("");
		  setTimeout(function(){
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Reason" data-type="Reason" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "banoffline2";
		   }, 200);
		  break;
		  case "ban1": 
		  $.post('https://0R-admin/Ban', JSON.stringify({  id: last_player_id, reason: $(".databox").val()  }), function(x){});
		  setTimeout(function(){ $(".inputs").css("display","none"); $(".inputs").html("");   }, 200);
		  break;
 
	   }
	   
	   stateL.input = null;
	}else {
	if(state == "main") {
	   
	   switch(stateL.cur_main) {
		case 1: 
		$.post('https://0R-admin/GET.PLAYERS', JSON.stringify({}), function(x){
            state = "playerlist";
			$(".list").html(`<div id="header" class="list-item-header"><span> [ID]</span>${Lang("PLAYERNAME")}</div>`);
			stateL.playerlist = x.length + 1;
			if (x != null) {
				$.each(x, function(id, player){
					var selected = "selected";
					if(id != 0) { selected = "";   }else { //stateL.cur_playerlist = player.id; 
					
					}
					id = id + 1;
					var Element = `<div id="1_2_${id}" class="list-item ${selected}" data-id="${player.id}" ><span> [${player.id}]</span>${player.name}</div>`;
					$(".list").append(Element); 
					
				});
			}
        })
		break;
		case 2: 
		$(".list").html(`
		<div id="header" class="list-item-header">${Lang("SERVERSETTINGS")}</div>
		<div id="2_1_1" class="list-item selected"  >${Lang("SETTIME")}</div>
		<div id="2_1_2" class="list-item"  >${Lang("SETWEATHER")}</div>
		<div id="2_1_3" class="list-item"  >${Lang("FREEZETIME")}</div>
		<div id="2_1_4" class="list-item"  >${Lang("FREEZEWEATHER")}</div>
		<div id="2_1_5" class="list-item"  >${Lang("PLAYERBLIPS")}</div>
		<div id="2_1_6" class="list-item"  >${Lang("CLEARAREA")}</div>
		<div id="2_1_7" class="list-item"  >${Lang("ANNO")}</div>
		<div id="2_1_8" class="list-item"  >${Lang("REVIVEALL")}</div>
		<div id="2_1_9" class="list-item"  >${Lang("BRINGALL")}</div>
		<div id="2_1_10" class="list-item"  >${Lang("KICKALL")}</div>
		<div id="2_1_11" class="list-item"  >${Lang("DELETEALL")}</div>
		<div id="2_1_12" class="list-item"  >${Lang("WIPEOFF")}</div>
		<div id="2_1_13" class="list-item"  >${Lang("BANOFF")}</div>
		<div id="2_1_14" class="list-item"  >${Lang("CLEANJUDGE")}</div>
		`);
		setTimeout(function(){  state = "serversettings"; }, 100);
		break;
		case 3: 
		$(".list").html(`
		<div id="header" class="list-item-header">${Lang("DEVTOOLS")}</div>
		<div id="3_1_1" class="list-item selected"  >${Lang("TPM")}</div>
		<div id="3_1_2" class="list-item"  >${Lang("REVIVE")}</div>
	    <div id="3_1_3" class="list-item"  >${Lang("HEAL")}</div>
		<div id="3_1_4" class="list-item"  >${Lang("SUICIDE")}</div>
		<div id="3_1_5" class="list-item"  >${Lang("FIXCAR")}</div>
		<div id="3_1_6" class="list-item"  >${Lang("VECTOR3")}</div>
		<div id="3_1_7" class="list-item"  >${Lang("VECTOR4")}</div>
		<div id="3_1_8" class="list-item"  >${Lang("HEADING")}</div>
		<div id="3_1_9" class="list-item"  >${Lang("NOCLIP")}</div>
		<div id="3_1_10" class="list-item"  >${Lang("VANISH")}</div>		 
		`);
		setTimeout(function(){  state = "devtools"; }, 100);
		break;
		case 4: 
		$.post('https://0R-admin/GET.BANS', JSON.stringify({}), function(x){
            state = "bans";
			$(".list").html(`<div id="header" class="list-item-header"><span>[ID]</span>BAN LIST</div>`);
			stateL.bans = x.length + 1;
			if (x != null) {
				$.each(x, function(id, player){
					var selected = "selected";
					if(id != 0) { selected = "";   }else {  
					
					}
					id = id + 1;
					var Element = `<div id="4_${id}" class="list-item ${selected}" data-id="${player.id}" ><span style="color:red;" >[X]</span>${player.identifier}</div>`;
					$(".list").append(Element); 
					
				});
			}
        })
		break;
		case 5: 
		$.post("https://0R-admin/Close", function(data) {  });
		$("body").css("display","none"); 
		break;
        		 
	   }
	}
	
	if(state == "playerlist") {
	   
	   last_player_id = $("#1_2_"+stateL.cur_playerlist).data("id");
	   
	   $(".list").html(`
	    <div id="header" class="list-item selected">ID : ${last_player_id}</div>
		<div id="1_3_1" class="list-item selected">${Lang("REVIVE")}</div>
		<div id="1_3_2" class="list-item">${Lang("GOTO")}</div>
		<div id="1_3_3" class="list-item">${Lang("BRING")}</div>
		<div id="1_3_4" class="list-item">${Lang("HEAL")}</div>
		<div id="1_3_5" class="list-item">${Lang("KILL")}</div>
		<div id="1_3_6" class="list-item">${Lang("KICK")}</div>
		<div id="1_3_7" class="list-item">${Lang("BAN")}</div>
		<div id="1_3_8" class="list-item">${Lang("GIVECAR")}</div>
		<div id="1_3_9" class="list-item">${Lang("GIVEOWNED")}</div>
		<div id="1_3_10" class="list-item">${Lang("FREEZE")}</div>
		<div id="1_3_11" class="list-item">${Lang("OPENINV")}</div>
		<div id="1_3_12" class="list-item">${Lang("CLEARINV")}</div>
		<div id="1_3_13" class="list-item">${Lang("GIVEITEM")}</div>
		<div id="1_3_14" class="list-item">${Lang("SETJOB")}</div>
		<div id="1_3_15" class="list-item">${Lang("TAKESHOT")}</div>
		<div id="1_3_16" class="list-item" style="color:pink;">${Lang("WIPEPLAYER")}</div>
		`);
	   
	   setTimeout(function(){ state = "playerlist_alt"; }, 500);
	}
	
	if(state == "bans") {
	   last_player_id = $("#4_"+stateL.cur_bans).data("id");
	   $.post('https://0R-admin/DeleteBan', JSON.stringify({id: last_player_id }), function(x){});
	   $("#4_"+stateL.cur_bans).remove();
	   stateL.cur_bans = stateL.cur_bans - 1; 
	}
	
	if(state == "playerlist_alt") {
		
		switch(stateL.cur_playerlist_alt) {
		  case 1:
		  $.post('https://0R-admin/Revive', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 2:
		  $.post('https://0R-admin/Goto', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 3:
		  $.post('https://0R-admin/Bring', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 4:
		  $.post('https://0R-admin/Heal', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 5:
		  $.post('https://0R-admin/Kill', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 6:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Kick reason" data-type="reason" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "kick";
		  setTimeout(function(){ lockbackspace = true; }, 200);
		  break;
		  case 7:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Ban reason" data-type="reason" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "ban1";
		  setTimeout(function(){ lockbackspace = true; }, 200);
		  break;
		  case 8:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Car model" data-type="carmodel" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "givecar";
		  setTimeout(function(){ lockbackspace = true; }, 200);
		  break;
		  case 9:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Car model" data-type="carmodel" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "givecarown";
		  setTimeout(function(){ lockbackspace = true; }, 200);
		  break;
		  case 10:
		  $.post('https://0R-admin/Freeze', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 11:
		  $.post('https://0R-admin/OpenInv', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 12:
		  $.post('https://0R-admin/ClearInv', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 13:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Item name" data-type="itemname" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "giveitem1";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 14:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Job name" data-type="jobgrade" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "job1";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 15:
		  $.post('https://0R-admin/Takess', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		  case 16:
		  $.post('https://0R-admin/WipePlayer', JSON.stringify({id: last_player_id}), function(x){});
		  break;
		}
		
    }
	
	
	if(state == "serversettings") { 
	   
	   switch(stateL.cur_serversettings) {
		  case 1:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Set clock" data-type="clock" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "clock1";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 2:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Set Weather type" data-type="Weather" autofocus  />
		  <p>${Lang("AVAIBLETYPES")}: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween</p>
		  <br>
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "weather";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 3:
		  $.post('https://0R-admin/SetTime', JSON.stringify({ type: "freeze"}), function(x){});
		  break;
		  case 4:
		  $.post('https://0R-admin/SetWeather', JSON.stringify({  type: "freeze"}), function(x){});
		  break;
		  case 5:
		  $.post('https://0R-admin/PlayerBlips', JSON.stringify({ bool: blipbool = !blipbool  }), function(x){});
		  break;
		  case 6:
		  $.post('https://0R-admin/ClearArea', JSON.stringify({  }), function(x){});
		  break;
		  case 7:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="${Lang("ANNO")}" data-type="Announcement" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "Announcement";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 8:
		  $.post('https://0R-admin/ReviveAll', JSON.stringify({   }), function(x){});
		  break;
		  case 9:
		  $.post('https://0R-admin/BringAll', JSON.stringify({   }), function(x){});
		  break;
		  case 10:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="Kick all" data-type="Kick" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "kickall";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 11:
		  $.post('https://0R-admin/DeleteAllCars', JSON.stringify({   }), function(x){});
		  break;
		  case 12:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="identifier" data-type="identifier" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "wipeoffline";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 13:
		  $(".inputs").css("display","block");
		  $(".inputs").html(`
		  <input type="text" class="databox" placeholder="identifier" data-type="identifier" autofocus  />
		  <p>${Lang("PRESSENTER")}</p>
		  `);
		  $(".databox").focus();
		  stateL.input = "banoffline1";
		  setTimeout(function(){ lockbackspace = true; }, 100);
		  break;
		  case 14:
		  $.post('https://0R-admin/CleanJudge', JSON.stringify({   }), function(x){});
		  break;
	   }
	}
	
	if(state == "devtools") { 
	   
	   switch(stateL.cur_devtools) {
		 case 1:
		 $.post('https://0R-admin/Tpm', JSON.stringify({   }), function(x){});
		 break;
		 case 2:
		 $.post('https://0R-admin/Revive', JSON.stringify({ type:"self" }), function(x){});
		 break;
		 case 3:
		 $.post('https://0R-admin/Heal', JSON.stringify({ type:"self" }), function(x){});
		 break;
		 case 4:
		 $.post('https://0R-admin/Suicide', JSON.stringify({    }), function(x){});
		 break;
		 case 5:
		 $.post('https://0R-admin/CarFix', JSON.stringify({    }), function(x){});
		 break;
		 case 6:
		 $.post('https://0R-admin/copy', JSON.stringify({ type: "vector3"   }), function(x){});
		 break;
		 case 7:
		 $.post('https://0R-admin/copy', JSON.stringify({ type: "vector4"   }), function(x){});
		 break;
		 case 8:
		 $.post('https://0R-admin/copy', JSON.stringify({ type: "heading"   }), function(x){});
		 break;
		 case 9:
		 $.post('https://0R-admin/Noclip', JSON.stringify({    }), function(x){});
		 break;
		 case 10:
		 $.post('https://0R-admin/Vanish', JSON.stringify({    }), function(x){});
		 break;
		 
	   }
	}   
  }
}

BackSpace = () => {
	
		
	switch(state) {	
		case "main": 
		$.post("https://0R-admin/Close", function(data) { });
		$("body").css("display","none"); 
		break;
		case "playerlist": 
		$(".list").html(`
		<div id="1_1" class="list-item selected">${Lang("PLAYER_LIST")}</div>
		<div id="1_2" class="list-item">${Lang("SERVER_SETTINGS")}</div>
		<div id="1_3" class="list-item">${Lang("DEV_TOOLS")}</div>
		<div id="1_4" class="list-item">${Lang("BANS")}</div>
		<div id="1_5" class="list-item">${Lang("CLOSE")}</div>
		`);
		state = "main"; 
		break;
		
		case "playerlist_alt": 
		$.post('https://0R-admin/GET.PLAYERS', JSON.stringify({}), function(x){
            state = "playerlist";
			$(".list").html(`<div id="header" class="list-item-header"><span> [ID]</span>${Lang("PLAYERNAME")}</div>`);
			stateL.playerlist = x.length + 1;
			if (x != null) {
				$.each(x, function(id, player){
					var selected = "selected";
					if(id != 0) { selected = "";   }else { //stateL.cur_playerlist = player.id; 
					
					}
					id = id + 1;
					var Element = `<div id="1_2_${id}" class="list-item ${selected}" data-id="${player.id}" ><span> [${player.id}]</span>${player.name}</div>`;
					$(".list").append(Element); 
					
				});
			}
        })
		state = "playerlist"; 
		break;
		case "serversettings": 
		$(".list").html(`
		<div id="1_1" class="list-item selected">${Lang("PLAYER_LIST")}</div>
		<div id="1_2" class="list-item">${Lang("SERVER_SETTINGS")}</div>
		<div id="1_3" class="list-item">${Lang("DEV_TOOLS")}</div>
		<div id="1_4" class="list-item">${Lang("BANS")}</div>
		<div id="1_5" class="list-item">${Lang("CLOSE")}</div>
		`);
		state = "main"; 
		break;
		case "devtools": 
		$(".list").html(`
		<div id="1_1" class="list-item selected">${Lang("PLAYER_LIST")}</div>
		<div id="1_2" class="list-item">${Lang("SERVER_SETTINGS")}</div>
		<div id="1_3" class="list-item">${Lang("DEV_TOOLS")}</div>
		<div id="1_4" class="list-item">${Lang("BANS")}</div>
		<div id="1_5" class="list-item">${Lang("CLOSE")}</div>
		`);
		state = "main"; 
		break;
		case "bans": 
		$(".list").html(`
		<div id="1_1" class="list-item selected">${Lang("PLAYER_LIST")}</div>
		<div id="1_2" class="list-item">${Lang("SERVER_SETTINGS")}</div>
		<div id="1_3" class="list-item">${Lang("DEV_TOOLS")}</div>
		<div id="1_4" class="list-item">${Lang("BANS")}</div>
		<div id="1_5" class="list-item">${Lang("CLOSE")}</div>
		`);
		state = "main"; 
		break;
		
		
		
	}
	
	
	
}

$(document).on('keyup', function() {
    switch(event.keyCode) {
        case 38: 
            ChangeItem("up");
            break;
		case 40:
		    ChangeItem("down");
            break;
	    case 13:
			Enter();
			lockbackspace = false;
            break;
		case 27:
		    $(".inputs").css("display","none");
			$(".inputs").html("");
			lockbackspace = false;
			$(".ss").css("display","none");
            break;
		case 8:
		    if(lockbackspace == false) {
				BackSpace();
			}
			 $(".ss").css("display","none");
            break;
    }
});

var LangData = null;
 

window.addEventListener('message', function(event) {
   var data = event.data;	
   switch(event.data.action) {
     case "auth":
	   LangData = data.lang	
	   if (data.auth == "acsess") {
		   $("body").css("display","block");
		   $(".list").html(`
		<div id="1_1" class="list-item selected">${Lang("PLAYER_LIST")}</div>
		<div id="1_2" class="list-item">${Lang("SERVER_SETTINGS")}</div>
		<div id="1_3" class="list-item">${Lang("DEV_TOOLS")}</div>
		<div id="1_4" class="list-item">${Lang("BANS")}</div>
		<div id="1_5" class="list-item">${Lang("CLOSE")}</div>
	   `);
	   }
       break;
	  case "request_conf":
	  $(".ss").css("display","block");
      $("#src").attr("src", data.url);
	  break;
	  case "notify":
	  $(".snackbar").css({"bottom":"5vh", "display":"block"});
      $(".snackbar").html(data.value);
	  setTimeout(function(){ $(".snackbar").css({"bottom":"-5vh"});   }, 5000);
	  setTimeout(function(){ $(".snackbar").css({"display":"none"});   }, 10000);
	  break;
	  case "Announcement":
	  if(data.perm == false) {
	    $("body").css("display","block");
		$("body").html(`<div class="Announcement">${data.value}</div>`);
	  }else {
		$(".Announcement").html(data.value);
	  }
	  $(".Announcement").css({"bottom":"5vh", "display":"block"});
      $(".Announcement").html(data.value);
	  setTimeout(function(){ $(".Announcement").css({"bottom":"-5vh"});   }, 15000);
	  setTimeout(function(){ $(".Announcement").css({"display":"none"});  if(data.perm == false) { $("body").css("display","none"); }  }, 20000);
	  break;
	  case "copy":
      var clipboard = document.createElement('textarea');
      var selection = document.getSelection();
      clipboard.textContent = event.data.text;
      document.body.appendChild(clipboard);
      selection.removeAllRanges();
      clipboard.select();
      document.execCommand('copy');
      selection.removeAllRanges();
      document.body.removeChild(clipboard);
	  break;
   }
});


Lang = function(item) {    
    if (LangData[item]) {
        return LangData[item];
    } else {
        return item;
    }
}