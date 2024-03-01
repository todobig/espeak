# espeak
espeak TTS
extensions.conf


exten => 234567890,1,Answer()
 same => n,AGI(agi-set_variables.agi)
 same => n,NoOp(Customer Name is ${_first_name})
 same => n,NoOp(Lead id is ${lead_id})
 same => n,NoOp(Customer phone number ${phone_number})
 same => n,Espeak("Hello ${first_name}, you have an offer, Two, zero, six, seven, three, eight, seven, three, seven, zero. I repeat: two, zero, six, seven, three, eight, seven, three, seven, zero..",any)
 same => n,Hangup()
