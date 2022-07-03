# _Parks Lookup_

#### Authored by _Cameron Johnson,_


## _Technologies Used_

* _Ruby_
* _HTML_
* _psql_


## Description 

_This application populates an api filled with state and national parks with descriptions. It was constructed with the guidance of Epicodus._


## Setup/Installation Requirements

* _Clone or download the repository to your desktop._
* _Open in a code reader/writer I use vscode_ 
* _Open terminal in the root project directory_
* _run bundle install_
* _run pg_ctl start_ 
* _run rake db:create_
* _run rake db:test:prepare_
* _run rake db:migrate_
* _run rake db:seed_
* _run rails s_
* _run rspec_
* _open web browser go to localhost:3000 to see the json data if using google chrome i beleieve an extension is needed, works with firefox_

## Testing instructions 

* _In the terminal run rspec_

## API Endpoints
| Method | URL | Result |
| ------ | ------ | ------ |
| GET |	http://localhost:3000/parks?page=1 |	Returns a list of 10 parks in the database
| GET |	http://localhost:3000/parks?page=2 | 	Returns a list of 10 more parks in the database
| GET |	http://localhost:3000/parks/274 |	Returns all information related to park with ID=274
| POST |	http://localhost:3000/parks?name=cameron&managed_by=State&description=asdgahsdhadskjhdakjhgg 	|Adds park to database. Name: cameron, managed by State, Description: "asdgahsdhadskjhdakjhgg". If POST is succesfull, returns database object for newly created park.
| PUT/PATCH | 	http://localhost:3000/parks/274?name=Joe |	Updates the name for a park with ID=274. If PUT/PATCH is succesfull, returns database object for newly updated park.
| DELETE |	http://localhost:3000/parks/274 |	Deletes the park with ID=274 from database

## Known bugs
* _None_

## License 
 _This code utilizes a GPL License. If you have any issues/find bugs. Feel free to report them to me at here or contribute a fix to the code. Thanks!_ Copyright (c) _2022_ _Cameron Johnson_
