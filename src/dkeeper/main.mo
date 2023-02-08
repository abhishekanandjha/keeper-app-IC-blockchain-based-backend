import None "mo:base/None";
import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DKeeper{
  //datatype for the keeper app
  public type Note={
    title:Text;
    content:Text;
  };
  //its a list contains objects of type notes
  stable var notes:List.List<Note> =List.nil<Note>();

  public func createNote(titleText:Text,contentText:Text){
    let newNote:Note={
      title=titleText;
      content=contentText;
    };
    notes:=List.push(newNote,notes);
    Debug.print(debug_show(notes));
    //till now Create R U D is done registered in terminal of dfx start
  };
  //till now C Read U D is done registered in terminal of dfx start

  public query func readNotes():async [Note]{
    return List.toArray(notes);
  };
  //till now C R U Delete is done registered in terminal of dfx start
  public func removeNote(id:Nat){
      var listFront=List.take(notes,id);
      var listBack=List.drop(notes,id+1);

     notes:=List.append(listFront,listBack);
         //Debug.print("a;sldfj;lasdjf");

  }

}