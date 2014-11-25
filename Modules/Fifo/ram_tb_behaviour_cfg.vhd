configuration ram_tb_behaviour_cfg of ram_tb is
   for behaviour
      for all: ram use configuration work.ram_behaviour_cfg;
      end for;
   end for;
end ram_tb_behaviour_cfg;


