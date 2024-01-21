extends Node

var BlowOrSuck = false
var theTime
var benAndHard = false
var benMode = false

func retrieveTime(t):
	theTime=t

func sendTime():
	return theTime

func getBenAndHard():
	return benAndHard

func setBenAndHard(bo):
	benAndHard = bo

func getBlowOrSuck():
	return BlowOrSuck

func setBlowOrSuck(bos):
	BlowOrSuck=bos

func setBenMode(bm):
	benMode=bm

func getBenMode():
	return benMode
