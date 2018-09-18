params [["_issueScript","Unknown",[""]],["_issueText","---",[""]]];

private _issueArr = missionNamespace getVariable ["f_var_missionIssues",[]];

_issueArr pushBackUnique format["<font color='#72E500'>%1</font>: %2<br/>",_issueScript,_issueText];

missionNamespace setVariable ["f_var_missionIssues",_issueArr];
	
true