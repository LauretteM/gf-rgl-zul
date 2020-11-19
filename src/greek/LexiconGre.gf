concrete LexiconGre of Lexicon = CatGre ** 
  open ParadigmsGre,ResGre, BeschGre, Prelude in {

flags coding = utf8 ;



 lin

  add_V3 = dirV3 (v_Verb1dx "προσθέτω" "προσθέσω" "πρόσθεσα" "πρόσθετα")prepse ;
  airplane_N = mkN "αεροπλάνο" ;   
  alas_Interj = ss "αλλοίμονο" ;
  already_Adv = ss "ήδη" ;
  animal_N = mkN "ζώο" ;
  answer_V2S = mkV2S (v_Verb2a "απαντώ" "απαντήσω" "απάντησα" "απαντούσα")  gen ;
  apartment_N = mkN  "διαμέρισμα" "διαμερίσματα"  Neut;
  apple_N = mkN "μήλο" ;
  art_N = mkN "τέχνη" Fem ;
  ashes_N = mkN "στάχτη" Fem ;
  ask_V2Q = mkV2Q (v_Verb2a "ρωτώ" "ρωτήσω" "ρώτησα" "ρωτούσα")  acc ;
  baby_N =  mkN "μωρό" ;
  back_N = mkN "πλάτη" Fem; 
  bad_A = mkAd3 "κακός"  ;
  bank_N = mkN "τράπεζα"   Fem;
  bark_N =mkN "γάβγισμα" "γαβγίσματα"   Neut ;
  beautiful_A = mkAd3 "όμορφος" ;
  become_VA = mkVA (v_VerbDeponent3 "γίνομαι" "γίνω" "έγινα" "γινόμουν" "γίνε" "γίνετε" "γινωμένος") ;
  beer_N = mkNoun_thalassa "μπύρα" Fem ; 
  beg_V2V = mkV2V (v_Verb2a "παρακαλώ" "παρακαλέσω" "παρακάλεσα" "παρακαλούσα" ) acc acc  ;
  belly_N = mkN "κοιλιά"  ;
  big_A = mkAd3  "μεγάλος" ;
  bike_N = mkN  "ποδήλατο" "ποδηλάτων"   Neut; 
  bird_N = mkN "πουλί" ;
  bite_V2 = dirV2 (v_Verb1b "δαγκώνω" "δαγκώσω" "δάγκωσα" "δάγκωνα") ;
  black_A = mkA "μαύρος" ;
  blood_N = regIrreg "αίμα" ;
  blow_V = v_Verb2a "φυσώ" "φυσήξω" "φύσηξα" "φυσούσα" ;   
  blue_A = mkAdjAklito "μπλέ" ;
  boat_N = mkN "βάρκα"   Fem;
  bone_N = mkN "κόκκαλο"  ;
  breast_N  = mkN "στήθος"  Fem ;
  breathe_V = v_VerbNoPassive "αναπνέω" "αναπνεύσω" "ανέπνευσα" "ανέπνεα" "ανέπνευσε" "" ; 
  book_N =mkN "βιβλίο" ;
  boot_N = mkN "μπότα"   Fem;
  boss_N = mkN "αφεντικό" ;
  boy_N = mkN "αγόρι" Neut;
  bread_N = mkN "ψωμί" ;
  break_V2 = dirV2(v_VerbContr2 "σπάω" "σπάσω" "έσπασα" "έσπαζα") ;
  broad_A = mkA "ευρύς" "ευρέως" ;
  brother_N2 = ofN2 (mkN "αδελφός")  ;
  brown_A = mkAdjAklito "καφέ" ;
  burn_V= v_VerbContr2 "καίω" "κάψω" "έκαψα" "έκαιγα" ;
  butter_N = mkN "βούτυρο" "βουτύρων" Neut;
  buy_V2= dirV2 (v_Verb1d "αγοράζω" "αγοράσω" "αγόρασα" "αγόραζα" ) ;
  camera_N = mkN  "κάμερα" Fem;
  cap_N = mkN "καπάκι" Neut;
  car_N = mkN "αυτοκίνητο" "αυτοκινήτων"  Neut ;
  carpet_N = mkN "χαλί" ;
  cat_N = mkN "γάτα" Fem;
  ceiling_N = mkN "ταβάνι" Neut ;
  chair_N = mkN "καρέκλα" Fem ;
  cheese_N = mkN "τυρί";
  child_N = mkN "παιδί";
  church_N = mkN "εκκλησία" Fem;
  city_N = mkN "πόλη" "πόλεις" Fem;
  clean_A = mkAd3 "καθαρός" ;
  clever_A = mkAd3 "έξυπνος" ;
  close_V2 = dirV2 (v_Verb1c "κλείνω" "κλείσω" "έκλεισα" "έκλεινα") ;
  cloud_N= mkN  "σύννεφο" ;
  coat_N = mkN "παλτό" ;
  cold_A = mkAd "κρύος" ;
  come_V = v_VerbDeponent4 "έρχομαι" "έρθω" "ήρθα" "ερχόμουν" "έλα" "ελάτε" "ερχόμενος" ;
  computer_N = mkN "υπολογιστής" ;
  correct_A = mkAd3 "σωστός" ;
  country_N = mkN "χώρα" Fem;
  count_V2 = dirV2 (v_Verb2a "μετρώ" "μετρήσω" "μέτρησα" "μετρούσα") ;
  cousin_N = mkN  "ξάδελφος" "ξαδέλφων" Masc ;  
  cow_N = mkN "αγελάδα" ;
  cut_V2 = dirV2 (v_Verb1c "κόβω" "κόψω" "έκοψα" "έκοβα") ;
  day_N = mkN "μέρα" Fem;
  die_V = v_VerbNoPassive "πεθαίνω"  "πεθάνω" "πέθανα" "πέθαινα" "πέθανε" "πεθαμένος" ;
  dig_V =v_Verb1c "σκάβω" "σκάψω" "έσκαψα" "έσκαβα" ;
  dirty_A = regAdj "βρώμικος" ;
  distance_N3 = mkN3 (mkN "απόσταση" "αποστάσεις" Fem) (mkPrep "από"** {lock_Prep = <>}) (mkPrep "ως" ** {lock_Prep = <>});  
  doctor_N = mkN "γιατρός" ;
  dog_N = mkN "σκύλος" ;
  door_N = mkN "πόρτα" Fem;
  do_V2 = dirV2 (v_VerbNoPassive1 "κάνω" "κάνω" "έκανα" "έκανα" " ") ;
  drink_V2 = dirV2 (v_VerbContrIrregNPassPerf  "πίνω" "πιώ" "ήπια" "έπινα"); 
  dry_A = mkA "στεγνός" ;
  dull_A = mkA "αμβλύς" "αμβλέως" ;
  dust_N = mkN "σκόνη" Fem ;
  ear_N =mkN "αφτί" ;
  earth_N = mkN "γή" "γής" "γή" "γή" "" "" "" "" Fem ;
  easy_A2V = mkA2V (mkA "εύκολος") acc gen  ;
  eat_V2 = dirV2 (v_VerbContrIrreg "τρώω" "φάω" "έφαγα" "έτρωγα" ) ;
  egg_N = mkN "αβγό" ;
  empty_A =  mkAd  "άδειος" ;
  enemy_N = mkN "εχθρός" ;
  eye_N =mkN "μάτι" Neut ;
  factory_N = mkN "εργοστάσιο"  "εργοστασίων" Neut;
  fall_V = v_VerbNoPassive1 "πέφτω" "πέσω" "έπεσα" "έπεφτα" "πεσμένος"  ;
  far_Adv = ss "μακρυά" ;
  father_N2 = ofN2 (mkN "πατέρας") ;
  fat_N = mkN "λίπος" Neut ;
  fear_VS = mkVS (v_VerbDeponent "φοβάμαι" "φοβηθώ" "φοβήθηκα" "φοβόμουν" "φοβήσου" "φοβισμένος") ;
  fear_V2 =dirV2 (v_VerbDeponent "φοβάμαι" "φοβηθώ" "φοβήθηκα" "φοβόμουν" "φοβήσου" "φοβισμένος") ;
  feather_N = mkN "φτερό" ;
  fight_V2 = dirV2 (v_Verb2a "πολεμώ" "πολεμήσω" "πολέμησα" "πολεμούσα" ) ;
----  find_V2 = dirV2 (v_VerbContrIrreg3 "βρίσκω" "βρώ" "βρήκα" "έβρισκα" ); 
  fingernail_N = mkN "νύχι" Neut ;
  fire_N = mkN "φωτιά" ;
  fish_N = mkN "ψάρι" Neut ;
  float_V = v_VerbNoPassive1 "πλέω" "πλεύσω" "έπλευσα" "έπλεα" "πλεούμενος" ;
  floor_N = mkN "πάτωμα" "πατώματα" Neut;
  flower_N = mkN "λουλούδι" Neut ;
  flow_V = v_Verb2b "κυλώ" "κυλήσω" "κύλησα" "κυλούσα"  ;
  fly_V = v_Verb2b "πετώ" "πετάξω" "πέταξα" "πετούσα"  ;
  fog_N = mkN "ομίχλη" Fem ;
  foot_N = mkN "πόδι" Neut ;
  forest_N = mkN "δάσος" Neut ;
  forget_V2 = dirV2 (v_Verb2c "ξεχνώ" "ξεχάσω" "ξέχασα" "ξεχνούσα" );
  freeze_V = v_VerbNoPassive "παγώνω"  "παγώσω" "πάγωσα" "πάγωνα" "πάγωσε" "παγωμένος" ;
  fridge_N = mkN "ψυγείο" ;
  friend_N = mkN "φίλος" ; 
  fruit_N = mkN "φρούτο" ;
  full_A = mkA "γεμάτος" ;
  fun_AV = mkAV (mkAd "αστείος") ;
  garden_N = mkN "κήπος" ;
  girl_N = mkN "κορίτσι" Neut ;
  give_V3 =  dirV3  (v_Verb1a "δίνω" "δώσω" "έδωσα" "έδινα") gen   ;
  glove_N = mkN "γάντι" Neut;
  gold_N = mkN "χρυσός" ;
  good_A = mkAd3 "καλός" ;
  go_V = v_Verbirreg_pigaInw "πηγαίνω" "πάω" "πήγα" "πήγαινα" ;
  grammar_N =mkN "γραμματική" ;
  grass_N =  mkN "γρασίδι" Neut ;
  green_A = regAdj "πράσινος" ;
  guts_N = mkN "έντερο" "εντέρων" Neut ; 
  hair_N =mkN "τρίχα" Fem ;
  hand_N = mkN "χέρι" Neut ;
  harbour_N = mkN "λιμάνι" Neut;
  hate_V2 = dirV2 (v_mkVerb2B3 "μισώ" "μισήσω"  "μίσησα" "μισούσα"); 
  hat_N = regN "καπέλο" ;
  head_N =mkN "κεφάλι" Neut ;
  heart_N =mkN "καρδιά"  ;
  hear_V2 = dirV2 (v_VerbContr "ακούω" "ακούσω" "άκουσα" "άκουγα"); 
  heavy_A =mkAd4 "βαρύς" ;
  hill_N = mkN "λόφος" ;
  hit_V2 = dirV2 (v_Verb2a "χτυπώ" "χτυπήσω" "χτύπησα" "χτυπούσα" );  
  hold_V2 = dirV2 (v_Verb2a "κρατώ" "κρατήσω" "κράτησα" "κρατούσα" );  
  hope_VS = mkVS  (v_VerbNoPassive "ελπίζω" "ελπίσω" "ήλπισα" "ήλπιζα" "έλπισε" " ") ;
  horn_N =mkN "κέρατο" "κεράτων" Neut;
  horse_N = mkN "άλογο" "αλόγων" Neut;
  hot_A = mkAd3 "ζεστός" ;
  house_N = mkN "σπίτι" Neut;
  hunt_V2 =dirV2 (v_Verb2a "κυνηγώ" "κυνηγήσω" "κυνήγησα" "κυνηγούσα" );  
  husband_N =mkN "σύζηγος"  "συζήγων" Masc ;
  ice_N = mkN "πάγος" ;
  important_A = mkAd3 "σημαντικός" ;
  industry_N = mkN "βιομηχανία" Fem ;
  iron_N = mkN "σίδερο" ;
  john_PN = mkPN "Γιάννης" ;
  jump_V = v_Verb2a "πηδώ" "πηδήξω" "πήδηξα" "πηδούσα";
  kill_V2= dirV2 (v_Verb1dx "σκοτώνω"  "σκοτώσω" "σκότωσα" "σκότωνα" ) ;
  king_N = regNaniso  "βασιλιάς"  ;
  knee_N = mkN "γόνατο" "γονάτων" Neut; 
  know_V2 = dirV2 (v_VerbNoPassive1 "ξέρω" "ξέρω" "ήξερα" "ήξερα" " ");  
  know_VQ = mkVQ (v_VerbNoPassive1 "ξέρω" "ξέρω" "ήξερα" "ήξερα" " ");  
  know_VS = mkVS (v_VerbNoPassive1 "ξέρω" "ξέρω" "ήξερα" "ήξερα" " ");    
  lake_N = mkN "λίμνη"  Fem;
  lamp_N = mkN "λάμπα" Fem ;
  language_N =mkN "γλώσσα" Fem ;
  laugh_V = v_Verb2a "γελώ" "γελάσω" "γέλασα" "γελούσα" ;
  leaf_N = mkN "φύλλο" ;
  learn_V2 = dirV2 (v_Verb1dxx "μαθαίνω" "μάθω" "έμαθα" "μάθαινα"); 
  leather_N = mkN "δέρμα" "δέρματα" Neut ;
  leave_V2 = dirV2 (v_Verb1b "αφήνω" "αφήσω" "άφησα" "άφηνα" );
  left_Ord =mkA "αριστερός";
  leg_N = mkN "πόδι" Neut ;
  lie_V = compoundV (v_VerbContrIrreg2 "λέω" "πώ" "είπα" "έλεγα"  ) "ψέματα" ;
  like_V2 = dirV2 (v_Verb2a "αγαπώ" "αγαπήσω" "αγάπησα" "αγαπούσα" );
  like_V2 = dirV2 (v_Verb2a "αγαπώ" "αγαπήσω" "αγάπησα" "αγαπούσα" );
  listen_V2 = dirV2 (v_VerbContr "ακούω" "ακούσω" "άκουσα" "άκουγα"); 
  liver_N = mkN "συκώτι" Neut ;
  live_V = VerbNoPassive4 "ζώ" "ζήσω"  "έζησα" "ζούσα" "ζήσε" " " ;
  long_A = mkAd4 "μακρύς" ;
  lose_V2 = dirV2 (v_Verb1a "χάνω" "χάσω" "έχασα" "έχανα") ;
  louse_N =mkN "ψείρα" Fem; 
  love_N = mkN "αγάπη" Fem ;
  love_V2 = dirV2 (v_Verb2a "αγαπώ" "αγαπήσω" "αγάπησα" "αγαπούσα" );
  man_N = mkN "άνδρας" Masc ;
  married_A2 = mkA2 (mkA "παντρεμένος") (mkPrep "με" ** {lock_Prep = <>});
  meat_N = regIrreg "τέρας"  ;
  milk_N = regIrreg "γάλα" ;
  moon_N = mkN "φεγγάρι" Neut;
  mother_N2 = ofN2 (mkN "μητέρα");
  mountain_N = mkN  "βουνό";
  mouth_N =   mkN "στόμα" "στόματα" Neut;
  music_N = mkN "μουσική" ;
  name_N = mkN "όνομα" "ονόματα" Neut;
  narrow_A = mkA "στενός" ;
  near_A = mkA "κοντινός" ;
  neck_N = mkN "λαιμός" ;
  new_A = mkAd "καινούριος" ;
  newspaper_N = mkN "εφημερίδα" ;
  night_N = mkN "νύχτα" Fem ;
  nose_N  = mkN "μύτη" Fem ;
  now_Adv = ss "τώρα" ;
  number_N  = mkN "αριθμός" ;
  oil_N = mkN "λάδι" Neut;
  old_A = mkAd "παλιός" ;
  open_V2 = dirV2 (v_Verb1b "ανοίγω" "ανοίξω" "άνοιξα" "άνοιγα");  
  paint_V2A = mkV2A (v_Verb1a "βάφω" "βάψω" "έβαψα" "έβαφα"  )  acc acc;
  paper_N = mkN "χαρτί" ;
  paris_PN = mkPN "Παρίσι" ;
  peace_N = mkN "ειρήνη"  Fem;
  pen_N = mkNounAklito "στυλό" Neut;
  person_N = mkN "πρόσωπο" "προσώπων" Neut ;
  planet_N = mkN "πλανήτης" Neut;
  plastic_N = mkN "πλαστικό" ;
  play_V = v_Verb1a "παίζω" "παίξω" "έπαιξα" "έπαιζα" ;
  play_V2 = dirV2 (v_Verb1a "παίζω" "παίξω" "έπαιξα" "έπαιζα" );  
  policeman_N = mkN "αστυνομικός" ;
  priest_N = regNaniso  "παπάς" ;
  probable_AS = mkAS (mkAd3 "πιθανός") ;
  pull_V2 = dirV2 ( v_Verb2a "τραβώ" "τραβήξω" "τράβηξα" "τραβούσα" ) ;
  push_V2 = dirV2 (v_Verb1c "σπρώχνω" "σπρώξω" "έσπρωξα" "έσπρωχνα" ) ;
  put_V2 = dirV2 (v_Verb1c "βάζω" "βάλω" "έβαλα" "έβαζα" ) ;
  queen_N = mkN "βασίλισσα" Fem;
  question_N = mkN  "ερώτηση" "ερωτήσεις" Fem ;
  radio_N = mkN "ραδιόφωνο" "ραδιοφώνων" Neut ;
  rain_N = mkN "βροχή" ;
  rain_V0 = mkV0 (v_mkVerbAproswpo "βρέχει" "βρέξει" "έβρεξε" "έβρεχε") ;
  read_V2 = dirV2 (v_Verb1d "διαβάζω" "διαβάσω" "διάβασα" "διάβαζα");  
  ready_A = mkA "έτοιμος" ;
  reason_N = mkN "λόγος" ;
  red_A = regAdj "κόκκινος" ;
  religion_N = mkN "θρησκεία" Fem ;
  restaurant_N = mkN "εστιατόριο"  "εστιατορίων" Neut ;   
  right_Ord =mkAd "δεξιός" ;
  river_N = mkN "ποτάμι" Neut ;
  road_N  = mkN "δρόμος" ;
  rock_N = mkN "βράχος" ;
  roof_N = mkN "στέγη" Fem;
  root_N = mkN "ρίζα" Fem ;
  rope_N = mkN  "σχοινί" ;
  rotten_A = mkAd "σάπιος" ;
  round_A = mkA "στρογγυλός" ;
  rubber_N = mkN "γόμα" Fem ;   
  rub_V2 = dirV2 (v_Verb1a "τρίβω" "τρίψω" "έτριψα" "έτριβα") ;
  rule_N = mkN "κανόνας" ;
  run_V =  VerbNoPassive1 "τρέχω" "τρέξω" "έτρεξα" "έτρεχα"  " " ;   
  salt_N = mkN "αλάτι" Neut;
  sand_N = mkN "άμμος" "άμμων"  Fem;
  say_VS = mkVS ( v_VerbContrIrreg2 "λέω" "πώ" "είπα" "έλεγα");
  school_N = mkN "σχολείο" ;
  science_N = mkN "επιστήμη" Fem ;
  scratch_V2 = dirV2 (v_Verb1a "ξύνω" "ξύσω" "έξυσα" "έξυνα") ;
  sea_N = mkN "θάλασσα" Fem ;
  seed_N =mkN "σπόρος" ;
  seek_V2 = dirV2 (v_Verb2a "αναζητώ"  "αναζητήσω" "αναζήτησα" "αναζητούσα");  
  see_V2 = dirV2 ( v_VerbContrIrreg3  "βλέπω" "δώ" "είδα" "έβλεπα" );
  sell_V3 = dirV3 (v_Verb2a "πουλώ" "πουλήσω" "πούλησα" "πουλούσα") prepse;
  send_V3 = dirV3 (v_Verb1a "στέλνω" "στείλω" "έστειλα" "έστελνα") prepse ;
  sew_V = v_Verb1a "ράβω" "ράψω" "έραψα" "έραβα" ;
  sharp_A =mkA  "αιχμηρός" ;
  sheep_N = mkN "πρόβατο" "προβάτων" Neut ;
  ship_N = mkN "πλοίο" ;
  shirt_N = mkN "πουκάμισο" ;
  shoe_N = mkN "παπούτσι" Neut;
  shop_N = mkN "κατάστημα" "καταστήματα" Neut ;
  short_A = mkAd "κοντός" ;
  silver_N = mkN "ασήμι" Neut;
  sing_V = v_Verb2a "τραγουδώ" "τραγουδήσω" "τραγούδησα" "τραγουδούσα" ;
  sister_N = mkN "αδελφή" ;
  sit_V = v_VerbDeponent5 "κάθομαι" "καθήσω" "κάθησα" "καθόμουν" "κάθισε" "καθίστε" "καθισμένος" ;
  skin_N = regIrreg "δέρμα" ;
  sky_N = mkN "ουρανός" ;
  sleep_V = v_VerbDeponent "κοιμάμαι" "κοιμηθώ" "κοιμήθηκα" "κοιμόμουν" "κοιμήσου" "κοιμισμένος" ;
  small_A = mkAd3 "μικρός" ;
  smell_V = v_Verb1d "μυρίζω" "μυρίσω" "μύρισα" "μύριζα" ;
  smoke_N = mkN "καπνός" ;
  smooth_A = mkA "μαλακός" ;
  snake_N = mkN "φίδι"  Neut;
  snow_N  = mkN "χιόνι"  Neut;
  sock_N = mkN "κάλτσα"  Fem ;
  song_N = mkN "τραγούδι"  Neut ;
  speak_V2 = dirV2 ( v_Verb2a "μιλώ" "μιλήσω" "μίλησα" "μιλούσα") ;
  spit_V = v_Verb1c "φτύνω" "φτύσω" "έφτυσα" "έφτυνα" ;
  split_V2 = dirV2 (v_Verb1d "χωρίζω" "χωρίσω" "χώρισα" "χώριζα") ;
  squeeze_V2 = dirV2 (v_Verb1c "σφίγγω" "σφίξω" "έσφιξα" "έσφιγγα" );
  stab_V2 =  dirV2 (v_Verb1b "μαχαιρώνω" "μαχαιρώσω" "μαχαίρωσα" "μαχαίρωνα");
  stand_V = v_VerbDeponent2 "στέκομαι" "σταθώ" "στάθηκα" "στεκόμουν" "στάσου" "στεκόμενος" ;
  star_N = mkN "αστέρι"  Neut ; 
  steel_N = mkN "ατσάλι" Neut;
  stick_N = mkN "ραβδί" ;
  stone_N = mkN "πέτρα" Fem ;
  stop_V = v_Verb2a "σταματώ" "σταματήσω" "σταμάτησα" "σταματούσα" ;
  stove_N =  mkN "φούρνος" ;
  straight_A = mkAd "ίσιος" ;
  student_N = mkN  "φοιτητής" ; 
  stupid_A = mkAdIrreg  "ηλίθιος" ; 
  suck_V2 = dirV2 ( v_Verb2a "ρουφώ" "ρουφήξω" "ρούφηξα" "ρουφούσα") ;
  sun_N = mkN "ήλιος"  ;
  swell_V =  v_Verb1c "πρήζω" "πρήξω" "έπρηξα" "έπρηζα" ;
  swim_V =  v_VerbNoPassive3 "κολυμπώ" "κολυμπήσω" "κολύμπησα" "κολυμπούσα" "κολύμπα" "" ;
  switch8off_V2 = dirV2 (v_Verb1a "σβήνω" "σβήσω" "έσβησα" "έσβηνα") ;
  switch8on_V2 = dirV2 (v_Verb1b "ανάβω" "ανάψω" "άναψα" "άναβα") ;
  table_N = mkN "τραπέζι" Neut ;
  tail_N =mkN "ουρά"  ;
  talk_V3 = mkV3 (v_Verb2a "μιλώ" "μιλήσω" "μίλησα" "μιλούσα")  prepse (mkPreposition "για" ** {lock_Prep = <>}) ;
  teacher_N =mkN "δάσκαλος" "δασκάλων" Masc; 
  teach_V2 = dirV2 ( v_Verb1d "διδάσκω" "διδάξω" "δίδαξα" "δίδασκα") ;
  television_N = mkN "τηλεόραση" "τηλεοράσεις" Fem ;
  thick_A = mkAd "παχύς";
  thin_A = mkA "λεπτός" ;
  think_V = v_VerbDeponent2 "σκέφτομαι" "σκεφτώ" "σκέφτηκα" "σκεφτόμουν" "σκέψου" "σκεπτόμενος" ;
  throw_V2 = dirV2 (v_Verb1c "ρίχνω" "ρίξω" "έριξα" "έριχνα" );
  tie_V2 = dirV2 (v_Verb1a "δένω" "δέσω" "έδεσα" "έδενα" );
  today_Adv = ss "σήμερα" ;
  tongue_N =mkN "γλώσσα" Fem;
  tooth_N  = mkN "δόντι" Neut;
  train_N = mkN "τρένο";
  travel_V  = v_Verb1b "ταξιδεύω" "ταξιδέψω" "ταξίδεψα" "ταξίδευα"  ;
  tree_N = mkN "δέντρο";
  turn_V = v_Verb1d "γυρίζω" "γυρίσω" "γύρισα" "γύριζα" ;  
  ugly_A = mkA "άσχημος" ;
  uncertain_A = mkA "αβέβαιος" ;
  understand_V2 = dirV2 (v_VerbNoPassive  "καταλαβαίνω"  "καταλάβω" "κατάλαβα" "καταλάβαινα" "κατάλαβε" " ") ;
  university_N = mkN "πανεπιστήμιο" "πανεπιστημίων" Neut;
  village_N = mkN "χωριό";
  vomit_V = v_Verb2c "ξερνώ" "ξεράσω" "ξέρασα" "ξερνούσα" ;
  wait_V2 = dirV2 ( v_VerbNoPassive "περιμένω"  "περιμένω" "περίμενα" "περίμενα" "περίμενε" " ") ;
  walk_V = v_Verb2a "περπατώ" "περπατήσω" "περπάτησα" "περπατούσα" ;
  warm_A = mkAd3 "ζεστός" ;
  war_N = mkN "πόλεμος" "πολέμων" Masc;
  wash_V2 = dirV2 (v_Verb1c "πλένω" "πλύνω" "έπλυνα" "έπλενα" );
  watch_V2 = dirV2 (v_Verb1b "κοιτάζω" "κοιτάξω" "κοίταξα" "κοίταζα");
  water_N = mkN "νερό";
  wet_A = mkA "υγρός" ;
  white_A = mkA "άσπρος" ;
  wide_A = mkAd "φαρδύς" ;
  wife_N =mkN "σύζηγος"  "συζήγων" Fem ;
  wind_N = regNaniso "αέρας" ;
  window_N = mkN "παράθυρο" "παραθύρων" Neut ;
  wine_N = mkN "κρασί" ;
  wing_N = mkN "φτερό" ;
  win_V2 = dirV2 (v_Verb1dx "κερδίζω" "κερδίσω" "κέρδισα" "κέρδιζα") ;
  wipe_V2 = dirV2 (v_Verb1dx "σκουπίζω" "σκουπίσω" "σκούπισα" "σκούπιζα") ;
  woman_N =mkN "γυναίκα" Fem;
  wonder_VQ = mkVQ (v_VerbDeponent "αναρωτιέμαι" "αναρωτηθώ" "αναρωτήθηκα" "αναρωτιόμουν" "αναρωτήσου" "αναρωτώμενος") ;
  wood_N = mkN "ξύλο" ;
  worm_N = mkN "σκουλήκι"  Neut ;
  write_V2 = dirV2 (v_Verb1a "γράφω" "γράψω" "έγραφα" "έγραψα" ) ;
  year_N = regIrreg "χρόνος" ;
  yellow_A = mkA "κίτρινος" ;
  young_A = mkAd "νέος" ; 

} ;
