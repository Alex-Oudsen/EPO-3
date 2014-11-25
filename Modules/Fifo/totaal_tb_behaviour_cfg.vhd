configuration totaal_tb_behaviour_cfg of totaal_tb is
   for behaviour
      for all: fifo_totaal use configuration work.fifo_totaal_behaviour_cfg;
      end for;
   end for;
end totaal_tb_behaviour_cfg;


