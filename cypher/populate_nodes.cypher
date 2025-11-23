User(Usuario):
CREATE (:User {id:'u1', name:'Alice Monteiro', age:25});
CREATE (:User {id:'u2', name:'Bruno Silva', age:32});
CREATE (:User {id:'u3', name:'Carla Souza', age:28});
CREATE (:User {id:'u4', name:'Diego Ramos', age:40});
CREATE (:User {id:'u5', name:'Elisa Ferreira', age:22});
CREATE (:User {id:'u6', name:'Fernando Costa', age:35});
CREATE (:User {id:'u7', name:'Gabriela Lima', age:27});
CREATE (:User {id:'u8', name:'Henrique Alves', age:30});
CREATE (:User {id:'u9', name:'Isabela Rocha', age:29});
CREATE (:User {id:'u10', name:'João Pereira', age:33});
-------------------------------------------------------
Genre(Gênero):
CREATE (:Genre {name:'Action'});
CREATE (:Genre {name:'Thriller'});
CREATE (:Genre {name:'Mystery'});
CREATE (:Genre {name:'Drama'});
CREATE (:Genre {name:'Sci-Fi'});
CREATE (:Genre {name:'Fantasy'});
CREATE (:Genre {name:'Romance'});
CREATE (:Genre {name:'Comedy'});
CREATE (:Genre {name:'Horror'});
CREATE (:Genre {name:'Documentary'});
--------------------------------------------------------
Movie(Filme):
CREATE (:Movie {title:'Fire Horizon', year:2023, duration:120, mainStyle:'Action'});
CREATE (:Movie {title:'Ghost Code', year:2022, duration:110, mainStyle:'Thriller'});
CREATE (:Movie {title:'The Last Portal', year:2021, duration:105, mainStyle:'Sci-Fi'});
CREATE (:Movie {title:'Time Fragments', year:2020, duration:98, mainStyle:'Romance'});
CREATE (:Movie {title:'Lunar Guardian', year:2019, duration:130, mainStyle:'Fantasy'});
CREATE (:Movie {title:'Lost Connection', year:2018, duration:115, mainStyle:'Drama'});
CREATE (:Movie {title:'The Formula', year:2017, duration:102, mainStyle:'Mystery'});
CREATE (:Movie {title:'Echoes of Silence', year:2016, duration:108, mainStyle:'Horror'});
CREATE (:Movie {title:'Mortal Prism', year:2015, duration:95, mainStyle:'Action'});
CREATE (:Movie {title:'Invisible Legacy', year:2014, duration:100, mainStyle:'Documentary'});
-----------------------------------------------------------
Director(Diretor):
CREATE (:Director {name:'Helena Costa', age:52, nationality:'Portuguese'});
CREATE (:Director {name:'Zhang Wei', age:60, nationality:'Chinese'});
CREATE (:Director {name:'Michael O’Reilly', age:58, nationality:'Irish'});
CREATE (:Director {name:'Carmen Delgado', age:49, nationality:'Mexican'});
CREATE (:Director {name:'Farah Al-Mansour', age:55, nationality:'Jordanian'});
CREATE (:Director {name:'Jae-Hoon Park', age:47, nationality:'South Korean'});
CREATE (:Director {name:'Claire Dubois', age:50, nationality:'French'});
CREATE (:Director {name:'Sipho Dlamini', age:53, nationality:'South African'});
CREATE (:Director {name:'Olivia Spencer', age:46, nationality:'American'});
CREATE (:Director {name:'Jhon Damasceno', age:44, nationality:'Brazilian'});
----------------------------------------------------------
Actor(Ator):
CREATE (:Actor {name:'Rafael Torres', age:38, nationality:'Brazilian'});
CREATE (:Actor {name:'Chloe Bennett', age:33, nationality:'American'});
CREATE (:Actor {name:'Haruto Saito', age:41, nationality:'Japanese'});
CREATE (:Actor {name:'Isabella Romano', age:29, nationality:'Italian'});
CREATE (:Actor {name:'Omar El-Masri', age:36, nationality:'Egyptian'});
CREATE (:Actor {name:'Thandiwe Mokoena', age:34, nationality:'South African'});
CREATE (:Actor {name:'Viktor Ivanov', age:45, nationality:'Russian'});
CREATE (:Actor {name:'Aisha Khan', age:31, nationality:'Pakistani'});
CREATE (:Actor {name:'Lucas Andrade', age:27, nationality:'Brazilian'});
CREATE (:Actor {name:'Linh Nguyen', age:30, nationality:'Vietnamese'});
----------------------------------------------------------
Series:
CREATE (:Series {title:'Shadows of Tomorrow', year:2023, seasons:3, episodes:24, mainStyle:'Thriller'});
CREATE (:Series {title:'Hidden Codes', year:2022, seasons:2, episodes:18, mainStyle:'Mystery'});
CREATE (:Series {title:'Timeline', year:2021, seasons:4, episodes:40, mainStyle:'Sci-Fi'});
CREATE (:Series {title:'Parallel Worlds', year:2020, seasons:3, episodes:30, mainStyle:'Fantasy'});
CREATE (:Series {title:'Ghost City', year:2019, seasons:2, episodes:20, mainStyle:'Horror'});
CREATE (:Series {title:'Secret Truths', year:2018, seasons:1, episodes:10, mainStyle:'Drama'});
CREATE (:Series {title:'The Guardian', year:2017, seasons:5, episodes:50, mainStyle:'Action'});
CREATE (:Series {title:'Echoes of the Past', year:2016, seasons:2, episodes:16, mainStyle:'Romance'});
CREATE (:Series {title:'Infinite Mystery', year:2015, seasons:3, episodes:36, mainStyle:'Mystery'});
CREATE (:Series {title:'Lost Legacy', year:2014, seasons:1, episodes:12, mainStyle:'Documentary'});
