;-------------------------------------------------------------------------------------------------Coordinates

;X1 Y1 X2 Y2
global screenCoords := [0, 0, A_ScreenWidth, A_ScreenHeight]
global inventorySearchCoords := [915, 820, 1460, 1095]
global stashSearchCoords := [1800, 265, A_ScreenWidth, 1345]
global topMenuBarCoords := [A_ScreenWidth * 0.17, 0, A_ScreenWidth * 0.82, A_ScreenHeight * 0.9]
global MerchantBuyCoords := [0, A_ScreenHeight * 0.20, A_ScreenWidth * 0.3, A_ScreenHeight]
global merchantSellCoords := [1831, 834, 2477, 1114]
global centerScreenCoords := [A_ScreenWidth * 0.4, A_ScreenHeight * 0.4, A_ScreenWidth * 0.6, A_ScreenHeight*0.6]

;-------------------------------------------------------------------------------------------------Image to Text Queries
;-------------Gold
global FullGoldBagQuery := "|<>*240$31.zzzzzzzzzzzzzzzzzzzzzzyzzzzzrzzzzxzzzzzTzzzzrzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzrrzzzvvzzTxxzzjSyzzzrTTzzvjjzzxrrzzyvvzzzRzzziTRzzyzvk"
global EmptyGoldBagQuery := "|<>0xE0C06F@0.95$31.000000000000000000000000000000000000000000000000000000000000000000000000000000000E000000000000004400022000110000UU000EE0008800044000200000W000040000000000000000E"
global AnyGoldBagQuery := "|<>*72$20.zzVzksTw07z21zkUTwA7z11zkETwRDyyHzzxzzTTzYzzVbzUsTk/Xs5wQ3RX1rUEnzG0TsU" ; 10x10 pixels
global GoldCoinQuery := "|<>*96$21.zz0TzU0zs07y00zk0000000100000001000000000802800000201002000A00410001008004" ; 10x10 pixels
;-------------Buyables
global FullHealPotsQuery := "|<>*91$31.zzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzxzzzzk03zzk00Dzs003zw000zy000Dz0007zU001zk000zs000Qw000M6000Nt000BwU006yE003yM001sQ001w6007zt00DzwU0zzyE0zzTA3nzUDXlzsDzzzzzzzzzzk" ; 15x15
global FullBandagesQuery := "|<>*97$31.w000Dw000Dw000Dw000Dw000Ty000Dz000DzU007zk007zs007zw007zy007zz007zzU07zzk0Dzzs07ztw03zkC07znn03zvtU3zzwk3zzws1zzkw1zzsC1zzznkzzztizzzykzzyyTzzz0TzzzsTzzzzzzzzzzk" ; 15x15

global CrossbowQuery := ""
global FullBoltsQuery := ""
global StartOfInventoryQuery:= "|<>**20$39.000001c000005s00000jxk00051zzw00c1Q1k050S0C00c6U2M050g0f00cB0BM051M3C00c2U0k050E1m00c60+E053w2G00co0mE056U4W00co0Yk056UC600co1MU054k1A00jp03U056c6M00co1X005U"
global ItemBlueBackgroundColor := "0x1c2b36"
global ItemRedBackgroundQuery := "|<>*37$11.zzzzw7kC0M0U10204080E"
global EmptyItemSlotQuery := "|<>*26$51.zzzzzzzzrzzzzzzzyzzzzzzzzrzzzzzzzyzzzzzzzzrzzzzzzzyzzUbsk0zrzMLTi83yzs00000Drw000001yz100000Drs000001yz000000Dry000081yzU00000Dry000001yzn00000Drz000001yzs00000Drw000001yzm00000zryE0000Hyzk00000Dry800001yzk00000DrzM0A003yzx03U0ETryU0M003yzp060U0zrw000401yzk08000zry010007yzo08k02zry000007yzk0802Ezrz000007yzs00000zrz000003yzk00000Try000007yzk00040zrw0U0013yzUA01ulzry1s8zCzyzzzzzzzzrzzzzzzzyzzzzzzzzrzzzzzzzyzzzzzzzzrzzzzzzzy000000004"

;-------------Misc
global TradeCheckQuery := "|<>*180$11.uzlz7sDkTaTzDzDzDyDwE"
global QuestNotificationQuery := "|<>#9@0.63$11.szlzXz7yDyzxzvzzzzyDk"
global MerchantNotificationQuery := "|<>0xFFFF00@0.89$19.s43s70c7kA3s40s00Q00C007003U00U00E0080000E20M3UC1sDUsCw0SDUyE"

;-------------Merchants
global AlchemistQuery := "|<>*99$106.zzzzzzzzzzzzzwzzzzwztzztzzzzzzznzzzznzXzzXzzzzzzyTzzDz7zDzzDzzzzzzvzzwzsTwzzwzzzzzzzzzztzYznzznzzzxzzzzzzbyHzDUD87s7m11ty0s3n7wwwQCTDD3XXnvvkzCTnrvntwySSTDDDjbttzCTzDbbkttwwwDyTbnwtzwySMDbbnnsDtyTDnbzntsDySTDDsDbk0TCTzDbbzttwwzwSTDtwszQySDrbbnnvttszXnlvntwSSSTDDDbbbzD7UDDVs3tsQQQ0y4zwwz3xzDkzjnnnwDws"
global SurgeonQuery := "|<>*97$87.sDzzzzzzzzzzzzw0TzzzzzzzzzzzzDnzzzzzzzzzzzztyzzzzzzzzzzzzzDrjnrrwtzzzzzzszwzCES1D0zkDC3VzXtknbXnlsssCS3yTDDwwyTDDbbnw7nttz7bbknwQyTsSTDDwwwkSTXbnzXnttzUDUznyQyTySTDDy7wzyTnbnDvnttzbzXxlwwyNySSDDs1yDD7bbn07k8szU3s3w1wy43z7DDzyDVzkzjtzzzzzzjtzzzzzzzzzzzzsyTzzzzzzzzzzzz07zzzzzzzzzzzzy1zzzzzzzU"
global TreasurerQuery := "|<>*98$105.00zzzzzzzzzzzzzzzs07zzzzzzzzzzzzzzzyTzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzzyTzzzzzTz7jnzzzzzznyES1z0T0AzCET1wUyTknbbnXnvXtknbbVbnzDwySySTSTDDwySTyTtzDlrlkznttzDlnznzDtUzkD1yTDDtUyTyTtz1zlly3nttz1znznzDszwyDyCTDDszyTyTtz7vblvtnttz7vnznzDwSQyCTCSDDwSSTyTszk7k0k3k8szk7lznzDz3z7DVz7DDz3yTU"
global WoodsmanQuery := "|<>*99$115.zxzTzzzzzDzzzzzzzzzXyzbzzzzzbzzzzzzzzztzDrzzzzznzzzzzzzzzwT7nzzzzztzzzzzzzzzzDXtzzzzzgzzvzzzzyzzbkxw3y1z0T0AUETUTC3lkStswQTSDDi777b7UtwtCQySTDDbbrbbnrntwyRXQz6TXDnkznntvswyT6liTXDtbtw7ttwzUSTDmQbDtbwnwzUwwySCDDbtS7bsnyNyTyCSTCT7bnwD3lwsyQTDjbDDbDXntz7lwSSDDDbbnbbnbltwzXsz0TUDU0k3nkss0Qy7nwzkzsTsQy7vwwyCSza"
global CollectorQuery := "|<>*100$71.s7zzttzzzzzz73zzllzzzzxwT7zznnzzzzttzDzzbbzzzztryzzzDDzzzznjzz0yST0zkC0TzwswwwwyTC7zznttttwxyyTzzDlnnbsnzwvzyTnbbA7bztrzwzbDC3zDznjzNzCSQzyTzbDxlwwwszQTjCDnltttswwSyS0Dk7lls3w1wD1zkzbbsTwDws"

;-------------Buttons
;global StashButtonQuery := "|<>*60$83.y0zzzzzzzzz3zzk0Tzzzzzzzz7zz00TXzzzzzzy7zwTUz3zzzzzzwDzszny7zzzzzzsTzVzbyDzzzzzzkzz3zTwTzszzUzVsT1zz01y0Ts0T30S0zy07k0TU0y00S0Tz3z3kz7tw3kz0Dz7yDkyTrsTVzUDyDyTVwDzkz3zUDwTyy3s7zVy7zkDszz07s1z3wDzsTlzs4Ds0y7sSzszXz3sTy0wDkxzlz7yDkzzVsTVnzXyDsTVyzXkz33z7wTkz3tz7Vy60sTsHks7kMD3wA01zkDU03U0y7s40DzkzUADU7wTsM"
global StashButtonQuery := "|<>*62$81.w3zzzzzzzzy7zy03zzzzzzzzszzU0Dlzzzzzzz3zsz1y7zzzzzzsTz7yTkzzzzzzz3zsznz7zzzzzzsTz7yzszzlzz1z3ksDzs0Dk3z03sM30Tz03s0Dk0T00A0zy7y7VyDns7Vs1zszly7nyz3wDk7z7zDky7zsTVzUTszxy7kDz3wDy1z7zs0z0DsTVzwDszw27y0T3wBzlz7y7kzw1sTVjyDszly7zwD3w9zlz7wDkzTlsTV7yDszVy7nyD3w873z2S70y31sTV00zs7k01k0T3w40TzVz0MT0DszkU|<>*201$81.zzXbTzzzySzzzzzzDkzzzzkPzxzzzzy7zzzy1SSTzU7yzzzzzz70rjU0Dzzzzzzzs3xs01w7zzzzzzsTz3s7kzzzzzzz0TszVy7zzzzzzsTz7wTkzzzzzzz3zsTny0Ts7zk7sS70yy01w0Ds0D20M1jk0D01y01s01U3z07kM7VwT0QC0Dy7yDUwDnsDVw0zkzly7Uyz3wDs3y7zD0y0zsTVzkDkzy07k0z3wDz1y7z00zU3sTVjw7kzkS7z0D3w9zky7wDkzT1sTVDyDkzVy7nyD3w8zVy7QDUyDlsLV00Tk3UE6U0D3w807z0y00A03sTU01zs7s33s0z7y7nzzzzzzzzztzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzTzzzzzzy3zzzzvyDTzzzmFDbzzyzrnzzzyMRzzw"
global MerchantsButtonQuery := "|<>*60$157.3zzszzzzzzzzsTzzzzzzzzzzzzUzzsTzzzzzzzyDzzzzzzzzzzzzsDzsDzzzzzzzz3zzzzzzzzszzzw7zwDzzzzzzzzVzzzzzzzzwDzzy1zw7zzzzzzzzkzzzzzzzzy7zzz0zy3zzzzzzzzsTzzzzzzzzXzzzUDz1zsTtwDwDwD3zyDwzVzlzy3k7z0zk3w83s0y60zs1y70T01s0M1zYTk0z01s0D00Dk0TU07U1s0A8zWDlwDUtsy7US7kwDkD3wDwTa4Dl7lz3kysTbkz3sz3sTVz7yTr37lXszVsTwTvsTVyTVwDkzXz3zVVslwQ0wDyDzwDkzjky7sTlzUTkswsw01y7y7zy7sTw0T3wDszs1sQAQS07z3z3zz3wDs4DVy7wTy0AD6SD0zzVzVzzVy7ky7kz3yDzs27UD7Vzzkzkzzkz3sz3sTVz7zzV3s7XsTvsTwDxsTVsTVwDkzXzjsVw7lw7twDy3wwDkwDky7sTlzbwEz3sz00y7zU0S7sT3UT3wDsHkM8TVsTk0z0zs0T3w3U03Vy1w3s08TtwDw1zlzy0zXz3s33lzVz3y0S"
global QuestsButtonQuery := "|<>*68$77.zUDzzzzzzzzzzw07zzzzzzzzvzUw7zzzzzzzzly7y7zzzzzzzzXwTy7zzzzzzzz7kzwDznzzzzzy7XzwQTVzUDs1k17zsMT3w0D03U0Dzksz7swCT7lsTzVlyDXwQzTXkzz3XwT7UMTz7lzy77sw01k7yDVzwSDls0zs3wT3tswTXkDzw3sz30Xsz7Vzzz3ly0M7lwDVzQz7Xy1kTVkT0lswT3y00700D03k0y1z00T0kzUDk7y7"
global AcceptButtonQuery := "|<>*157$101.0ww0000003U1lzzzy1sw0000037c01zzzk1ks0000003s00jQTU71k0Dk0z07sT7swT0C3k1zw7zkzxzzzszUQ3UDzwzznzzzzzlz1t7Uz3zwDzVzDVzXy3X73k0z03w0yA0w0AD6C77VwS7lkS00s0sQQCQTXlyD7swDVwTkswQszjXyyDkszVszXlszXbyCTszVlzXly77sz7DwQzlk3Xb7XUCDlyCDsszU1z7CD70s01wQDlkz0zyCQSDlk03sQzVny7zwQswTrXz3szrXzSDwsznsziDz7kzD3wwDnlz7lzwTy7kwT3lwC7UwTVjlsSDU1y07s0T01zUzXYQTkDz0zw1y07b1yz0zzzyTzxzzwTzDzjw0zbzsTzVzyszsDyTnUy3zUDy0ztlzUDsw7UE00008003Xs9000SU0000000077mM001z000000000CT4000Ly00A01Y0M3TyK603zs0220200k0zy1Y03zk1s0001U00zs7004zUDU3003p001y1UF"

global FillButtonQuery := "|<>*119$161.zznzzzzzzzzzzzzzzzzzzzzzzzy03bbbzUDzzzzDySTzsDzzzzzwzw06T77zUTzzzyTwQTz07jzzzzszyThzDDzXzzzzwTwwzwzDDzzzztzwzTySTzbzzzzkzttztyzDzzzznztzzwwzzDTzzzYznnznzyTzzzTbznzbttzySQ7zz9zbbzXzk7UTU7A7bzbnnzww7DzwtzDDzVzkyQSTS7DATDbbztwyTztnySTzUznxwwywyS0yTDDzntwzzrbwwzzkTbvtsztwwzwySTzbntzzDbttzzsTDy3sDnttztwwzzDbnzyTDnnzzwyTnrw7bnnznttzyTDbzs0DbbzztwyTjz7DbbzbnnzwyTDznyTDDzTvtwzTTCTDTzDbbzlwyTzDwSSTyTbntwQyQyM3yD77y0twDyTwwQTw0TVs0M1tw07wySTw3rwztztttzw3zbstwDrwk"
global DealButtonQuery := "|<>*121$142.TzzzzzzbzzzzzzzzzzzzzzwwDzyDzzyDzzzzzlU7zzzzzzlsTzszzzwTzzzzzUE7zzzzzzXVzz3zzzlzzzzzyDwDzzzzzyC3zwDzzz7zzzzzszszzzzzzssDzUzzzwTzzzzzXzlzzzzzzXUTy3ztzlyDyzzyDz7zrzzDyC1zmDs1z7lz0TzszyDs3z0DssXz8z73wQDtszzXzszD7ssTXWDxXtyDlXzDlzyDzXtyDDlyCATaDbwT4TtzXzszyDDwQzXsslyMzTlw3zbwDzXzswzlvyDXXXnXzs7k7wS1zyDzXnkDz0yCCDCDwAT0Tk1zzszyC0DzVXsswNsz7lwMz1zzzXztsDzsyDXXlbXtz7llyTzzyDzbnzzDsyCDWyDbwT7XszzzszwT7zwzXssy3swTlwSDVzTzXzXwDvXyDXXwDXsw7lwT3nzyDwTsST7UyCDlyDU477sy0Dzs03zk1w0Us1zblzVtwzVw3zz01zzkTwDDnU"
global BackButtonQuery := "|<>*61$160.01zzzzzzzzzz01zzzzzzzzzzzzy03zzzzzzzzzs0Dzzzzzzzzzzzzs0zzzzyDzzXzs0zzzzzzzzzzwTzVzk01z03zk0zz7zs01zzzzzzkzz7zU07s07w01zwTzk03zzzzzzXzwTz3wT7kTVy3zlzzVw7zzzzzyDzlzyDtsznwDwDz7zz7wTzzzzzszz7zszzXzDlzlzwTzwTkzzzzzzXzwTzXzy7xy7zjzlzzlz7zVzz3yDVlzyDzw7zsTzzz7zz7wTk1zk3swD7zszzk7zXzzzwTzwTVy07w47XVwTzU1zU7wDzzzlzzk0DlwDlwSADlzy07zUDkzzzz7zz00z7kyDvs1z7zs0zzUD3zzzwTzw01yzXszjUDwTzXzzzUQDzzzlzzlz3zUD3zy0zlzyDzzz1szzzz7zz7yDk0wTzs1z7zszzzy7VzzzwTzwTsyDXkzzV7wTzXzTjwS7zvzlzzlzXlyD3zyADlzyDxwzlwDzDz7zz7yC7syDzssT7ztzbXz7kTszwTzwTksT3sTbXlwTw00C1kzU07zlzy007VsDU0SD3lzk00s07z00zz7zs00z00D03sy77z003k0zz0DzwTzU07y1Xz0TXwATzzzzzzzzzzzlzzzzzzzzzzzzzk1zzzzzzzzzy07zzzzzzzzzzzzz07zzzzzzzzzw0Tzzzzzzzzzzzzy0zzzzzzzzzzs3zzzzzzzzzzzzzU"
global TestQuery := "|<>##70x1c2b36-0x1d2b36-0x1e2c37-0x1d2c36-0x1d2c37-0x1b2934-0x1a2a35$0/0/F9F8F6,1/0/FCFBF8,2/0/F9F8F5,5/0/EBE9E6,4/1/8E8779,1/2/858077,-3/4/736F67,-3/2/757169,-4/2/262F36,-4/3/262F37,-4/4/1E2B36,-4/1/232E36,-3/-1/616B76,-1/-1/5E666F,-19/0/8B867E,-19/1/6C675F,-18/1/80796C,-18/2/464A4B,-18/0/A29F99,-17/1/3B4145,-19/-3/656F78,-20/-4/36434F,-10/1/1D2C37,-9/-1/1C2A35,-14/-2/1C2B36,-12/-7/1D2C37,-7/-11/B0B5BA,-12/-10/DFDCD7,-15/-10/DADAD3,-7/-10/85817B,-11/-12/303E49,-5/-12/3F4B55,-17/-13/1D2B36,-20/-6/716E67,-26/-5/182732"
global colorsToIgnoreCollection := ["0x1a2833-"
                                ;, "0x182732-"
                                , "0x1c2a35-"
                                , "0x1c2b36-"
                                , "0x1d2b36-"
                                , "0x1d2c37"
                                , "$"]
for _, object in colorsToIgnoreCollection
{
    global colorsToIgnore .= object
    ;0x1c2a35-0x1c2b36-0x1d2b36-0x1d2c37$
}
global GOLD_BAG_COLLECTION := {STASH_ANY_GOLD_BAG : "|<>##0" colorsToIgnore A_ScriptDir "\images\STASH_ANY_GOLD_BAG.png"
                            , STASH_EMPTY_GOLD_BAG : "|<>##0" colorsToIgnore A_ScriptDir "\images\STASH_EMPTY_GOLD_BAG.png"
                            , STASH_FULL_GOLD_BAG : "|<>##0" colorsToIgnore A_ScriptDir "\images\STASH_FULL_GOLD_BAG.png"
                            , MERCHANT_EMPTY_GOLD_BAG : "|<>##0" colorsToIgnore A_ScriptDir "\images\MERCHANT_ANY_GOLD_BAG.png"
                            , ""}

;-------------Collectibles
global  MerchantCollectiblesCollection := {DiamondQuery: "" ;------Singles
                                , EmeraldQuery: ""
                                , SapphireQuery : "|<>##7" colorsToIgnore A_ScriptDir "\images\Sapphire.png" 
                                , RubyQuery : "|<>##10" colorsToIgnore A_ScriptDir "\images\Ruby.png"
                                , DottedBangleQuery : ""
                                , GemNecklaceQuery : "|<>##7" colorsToIgnore A_ScriptDir "\images\GemNecklace.png"
                                , GemRingQuery : "|<>##4" colorsToIgnore A_ScriptDir "\images\GemRing.png"
                                , GlimmerBangleQuery : "|<>##4" colorsToIgnore A_ScriptDir "\images\GlimmerBangle.png"
                                , GoldCandlePlatterQuery : ""
                                ;, LeafGoldBangleQuery : "|<>0xFFFFB6@0.26$41.0000000000000000000000000000000000000000000000000000000000000000zUk00DXzXw00zjzDw03zTzzzkTzzzzzUzzzzzz1zzzzzy1zzzzzw3zzzTzs7zzyTzkDzzlzz0Tzznzz0zzzjzy1zzzzzs3zzzzzk7zzzzzU7zzzzz0Dzzzzy0Tzzzzk0rzzzzU07zzTy007zwzw007zkzk00Dz0w0001s000000000000000000000000000000000000000000000000000E"
                                ; ^ PASS BOTH CHECKS
                                , LightGoldBangleQuery : ""
                                , PatternedGoldBangleQuery : ""
                                , PearlNecklaceQuery : ""
                                , ShineBangleQuery : ""
                                , SimpleGoldBangle : ""
                                , SlimBangleQuery : "|<>##4" colorsToIgnore A_ScriptDir "\images\SlimBangle.png"
                                , TripleGemBangleQuery : ""
                                , TurquoiseGemBangleQuery : ""
                                ;------Doubles
                                ;, CeremonialDaggerQuery : "|<>*94$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzztzzzs0000000zz048E00000000Ds0V28000000003048F0000000000012000000000000800000000008002000000000T7zzz00000003zvzzzzlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
                                , GobletQuery : ""
                                , GoldChaliceQuery : ""
                                ;, GoldGobletQuery : "|<>##5" colorsToIgnore A_ScriptDir "\images\GoldGoblet.png"
                                ; ^ ~ MULTICOLOR HELLA PIXELS IN AND AROUND 70 RGB TOLERANCE
                                , SilverChaliceQuery : ""
                                ;------Quads
                                , GoldBowlQuery : ""
                                , GoldCandelabraQuery : ""
                                , GoldCandleHolderQuery : ""
                                , GoldCrownQuery : "|<>##5" colorsToIgnore A_ScriptDir "\images\GoldCrown.png"
                                ;, GoldWaterpotQuery : "|<>##72$" A_ScriptDir "\images\GoldWaterpot.png"
                                , AncientScrollQuery : "|<>*90$81.zzzzzzzzzzzzzzzzzzzzjzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzxzzzzzzzzzzzzy7zzzzzzzzzzzzkTzzzzzzzzzzzybzzzzzzzzzzzznzy7zzzzzzzzy0DzkzzzzzzzzzU1zy7zzzzzzzzw67zuzzzzzzzzz06ToDzzzzzzzzw0Pk1zzzzzzzzz01w07zzzzzzzzs07U7Tzzzzzzzz00w0Dzzzzzzzzs07U0Tzzzzzzzy00s03zzzzzzzzk0D00Dzzzzzzzi01s01zzzzzzzzk0D00Dzzzzzzzw03k01zzzzzzzzU0Q00Tzzzzzzzc03U03zzzzzzzz00w00zzzzzzzzk07007zzzzzzzw01s01zzzzzzzzk0D00Dzzzzzzzw01s03zzzzzzzzU0S00Tzzzzzzzs03k03zzzzzzzz00w00zzzzzzzzs07U07zzzzzzzy01w01zzzzzzzzk0D00Dzzzzzzzy03s03zz00000000T00007zzzzzw03k03zzzyzzzz00y00Tzzzzzzzs07k07zzzzzzzy00w00zzzzzzzzk0DU0Dzzzzzzzy01w01zzzzzzzzU0T00Dzzzzzzzw03s03zzzzzzzz00T00Tzzzzzzzs07k03zzzzzzzy00y00zzzzzzzzk07k07zzzzzzzy01w00zzzzzzzzU0DU0Dzzzzzzzw03w01zzzzzzzz00T00Dzzzzzzzs03s03zzzzzzzy00z00Tzzzzzzzk07k03zzzzzzzw01y00zzzzzzzzU0DU07zzzzzzzs01w00zzzzzzzz00TU0Dzzzzzzzs03s01zzzzzzzy00T00Dzzzzzzzk07s03zzzzzzzw00z00TzzzzzzzU0Dk03zzzzzzzs01y00zzzzzzzz00DU07zzzzzzzk03w00zzzzzzzy00TU07zzzzzzzU03s01zzzzzzzw00z00Dzzzzzzz007s01zzzzzzzs01y00Tzzzzzzy00Dk03zzzzzzzk01w00Tzzzzzzy00TU03zzzzzzzU03w00zzzzzzzw00T007zzzzzzz007s00zzzzzzzs00z007zzzzzzy00Dk01zzzzzzzk01y00Dzzzzzzw00DU01zzzzzzzU03w00Dzzzzzzs00TU03zzzzzzz003s00Tzzzzzzk00z003zzzzzzy007k00TzzzzzzU00y007zzzzzzw00Dk00zzzzz00001w00000007zs00DU00zzzzzzy003s00Dzyzzzzk00T001zzzzzzy007s00Dzzzzzzs00y001zzzzzzz007k00Tzzzzzzs01w003zzzzzzU00DU00Tzzzzzw0Q7s003zzzzzzU0zz000zzzzzzzU3zw007zzzzzzzVzzU00zzzzzzzrvzy007zzzzzzyTrwk01zzzzzzzlzz0Q0DzzzzzzyDzs0Q3zzzzzzzlzz00zzzzzzzzyTzz01zzzzzzzzXzzzUzzzzzzzzy7zz7mzzzzzzzzqTzwzbzzzzzzzyzzzXzzzzzzzzzrzzwTzzzzzzzzwzzzXzzzzzzzzyDzzwTzzzzzzzzUzzz3zzzzzzzzwDzzwDzzzzzzzzUTzzgzzzzzzzzw/zzxzzzzzzzzzVzzzjzzzzzzzzzzzzwzzzzzzzzzzzzwTzzzzzzzzzzzz1zzzzzzzzzzzzsDzzzzzzzzzzzz0zzzzzzzzzzzzs7zzzzzzzzzzzzVzjzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"}                                    
for _, object in MerchantCollectiblesCollection
{
    global CollectiblesString .= object
}
global MobGarbageCollection := {Grave Essence: ""
                            , GoblinEarsQuery : ""
                            , GoldenTeethQuery : "|<>##6" colorsToIgnore A_ScriptDir "\images\GoldenTeeth.png"
                            , KoboldEarsQuery : ""
                            , MimicToothQuery : "|<>##3" colorsToIgnore A_ScriptDir "\images\MimicTooth.png"
                            , RottenFluidsQuery : ""}
for _, object in MobGarbageCollection
{
    global MobGarbageString .= object
}
; WHY THE FUCK ARE THESE DIFFERENT.
; All 30-60 gray threshold
global StashCollectiblesCollection := {DiamondQuery: "" ;------Singles
                                    , EmeraldQuery: ""
                                    , SapphireQuery : ""
                                    , RubyQuery : "|<>**50$38.00zzU000n4vU01kV2S00EwFZg073UltU1kQMAwQH360vhj0P6DSs13cDtc0806D+06022EU1k0UoG0q0CAU0Qk1t00262380MUk0M00M60y00w0zw80Fz80M077zyQ00Qk6Q003Y3A000Aki0001o600006000000k002"
                                    , DottedBangleQuery : ""
                                    ;, GemNecklaceQuery : "|<>##8" colorsToIgnore A_ScriptDir "\images\GemNecklace.png"
                                    ;, GemRingQuery : "|<>*40$47.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzxzzzzzU01zzzzw000Tzzz00007zzy00003zzs00003zzk00003zzU00003zz00C003zy000E07zw00000Dzs00000Tzk00000zzU00001zz000003zy00000Dzw00000Tzw00001zzs00003zzs0000Dzzs0000zzzk0003zzzk000Tzzzs003zzzzw00Tzzzyzzzzzzzzzzzzzzzpzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
                                    , GlimmerBangleQuery :""
                                    , GoldCandlePlatterQuery : ""
                                    ;, LeafGoldBangleQuery : "|<>0xFFFFB6@0.26$41.0000000000000000000000000000000000000000000000000000000000000000zUk00DXzXw00zjzDw03zTzzzkTzzzzzUzzzzzz1zzzzzy1zzzzzw3zzzTzs7zzyTzkDzzlzz0Tzznzz0zzzjzy1zzzzzs3zzzzzk7zzzzzU7zzzzz0Dzzzzy0Tzzzzk0rzzzzU07zzTy007zwzw007zkzk00Dz0w0001s000000000000000000000000000000000000000000000000000E"
                                    ; ^ PASS BOTH CHECKS
                                    , LightGoldBangleQuery : ""
                                    , PatternedGoldBangleQuery : ""
                                    , PearlNecklaceQuery : ""
                                    , ShineBangleQuery : ""
                                    , SimpleGoldBangle : ""
                                    ;, SlimBangleQuery : "|<>##50$0/0/1A2833,38/0/1C2B36,38/20/1C2935,1/20/1B2935,14/4/E4E2DD,16/4/DFDDD6,18/4/CAC6BF,29/4/888C90,37/8/858B8D,29/17/AFABA2,11/16/5D5A54"
                                    ; ^ ~ MULTICOLOR HELLA PIXELS 50 RGB TOLERANCE
                                    , TripleGemBangleQuery : ""
                                    , TurquoiseGemBangleQuery : ""
                                    ;------Doubles
                                    ;, CeremonialDaggerQuery : "|<>*94$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzztzzzs0000000zz048E00000000Ds0V28000000003048F0000000000012000000000000800000000008002000000000T7zzz00000003zvzzzzlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
                                    , GobletQuery : ""
                                    , GoldChaliceQuery : ""
                                    ;, GoldGobletQuery : "|<>##5" colorsToIgnore A_ScriptDir "\images\GoldGoblet.png"
                                    ; ^ ~ MULTICOLOR HELLA PIXELS IN AND AROUND 70 RGB TOLERANCE
                                    , SilverChaliceQuery : ""
                                    ;------Quads
                                    , GoldBowlQuery : ""
                                    , GoldCandelabraQuery : ""
                                    , GoldCandleHolderQuery : ""
                                    ;, GoldCrownQuery : "|<>##5" colorsToIgnore A_ScriptDir "\images\GoldCrown.png"
                                    ;, GoldWaterpotQuery : "|<>##72$" A_ScriptDir "\images\GoldWaterpot.png"
                                    , AncientScrollQuery : "|<>*90$81.zzzzzzzzzzzzzzzzzzzzjzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzxzzzzzzzzzzzzy7zzzzzzzzzzzzkTzzzzzzzzzzzybzzzzzzzzzzzznzy7zzzzzzzzy0DzkzzzzzzzzzU1zy7zzzzzzzzw67zuzzzzzzzzz06ToDzzzzzzzzw0Pk1zzzzzzzzz01w07zzzzzzzzs07U7Tzzzzzzzz00w0Dzzzzzzzzs07U0Tzzzzzzzy00s03zzzzzzzzk0D00Dzzzzzzzi01s01zzzzzzzzk0D00Dzzzzzzzw03k01zzzzzzzzU0Q00Tzzzzzzzc03U03zzzzzzzz00w00zzzzzzzzk07007zzzzzzzw01s01zzzzzzzzk0D00Dzzzzzzzw01s03zzzzzzzzU0S00Tzzzzzzzs03k03zzzzzzzz00w00zzzzzzzzs07U07zzzzzzzy01w01zzzzzzzzk0D00Dzzzzzzzy03s03zz00000000T00007zzzzzw03k03zzzyzzzz00y00Tzzzzzzzs07k07zzzzzzzy00w00zzzzzzzzk0DU0Dzzzzzzzy01w01zzzzzzzzU0T00Dzzzzzzzw03s03zzzzzzzz00T00Tzzzzzzzs07k03zzzzzzzy00y00zzzzzzzzk07k07zzzzzzzy01w00zzzzzzzzU0DU0Dzzzzzzzw03w01zzzzzzzz00T00Dzzzzzzzs03s03zzzzzzzy00z00Tzzzzzzzk07k03zzzzzzzw01y00zzzzzzzzU0DU07zzzzzzzs01w00zzzzzzzz00TU0Dzzzzzzzs03s01zzzzzzzy00T00Dzzzzzzzk07s03zzzzzzzw00z00TzzzzzzzU0Dk03zzzzzzzs01y00zzzzzzzz00DU07zzzzzzzk03w00zzzzzzzy00TU07zzzzzzzU03s01zzzzzzzw00z00Dzzzzzzz007s01zzzzzzzs01y00Tzzzzzzy00Dk03zzzzzzzk01w00Tzzzzzzy00TU03zzzzzzzU03w00zzzzzzzw00T007zzzzzzz007s00zzzzzzzs00z007zzzzzzy00Dk01zzzzzzzk01y00Dzzzzzzw00DU01zzzzzzzU03w00Dzzzzzzs00TU03zzzzzzz003s00Tzzzzzzk00z003zzzzzzy007k00TzzzzzzU00y007zzzzzzw00Dk00zzzzz00001w00000007zs00DU00zzzzzzy003s00Dzyzzzzk00T001zzzzzzy007s00Dzzzzzzs00y001zzzzzzz007k00Tzzzzzzs01w003zzzzzzU00DU00Tzzzzzw0Q7s003zzzzzzU0zz000zzzzzzzU3zw007zzzzzzzVzzU00zzzzzzzrvzy007zzzzzzyTrwk01zzzzzzzlzz0Q0DzzzzzzyDzs0Q3zzzzzzzlzz00zzzzzzzzyTzz01zzzzzzzzXzzzUzzzzzzzzy7zz7mzzzzzzzzqTzwzbzzzzzzzyzzzXzzzzzzzzzrzzwTzzzzzzzzwzzzXzzzzzzzzyDzzwTzzzzzzzzUzzz3zzzzzzzzwDzzwDzzzzzzzzUTzzgzzzzzzzzw/zzxzzzzzzzzzVzzzjzzzzzzzzzzzzwzzzzzzzzzzzzwTzzzzzzzzzzzz1zzzzzzzzzzzzsDzzzzzzzzzzzz0zzzzzzzzzzzzs7zzzzzzzzzzzzVzjzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"}                                    
for _, object in StashCollectiblesCollection
{
    global StashCollectiblesString .= object
}