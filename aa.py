import MySQLdb
from sets import Set

def connDB():
  conn = MySQLdb.connect(user = 'aa', db = 'archeage')
  cur = conn.cursor()
  return (conn,cur)


def showClass(cur, classid, effects):
  cur.execute("""
              SELECT s.id,s.name,a.effect_id,c.effect_id,c.applies_effect,c.note
              FROM spell AS s
              LEFT JOIN applied AS a
              ON a.spell_id = s.id
              LEFT JOIN combo AS c
              ON c.spell_id = s.id
              WHERE s.class = %s
              """, (classid,))
  spells = {}
  uniqueapplied = Set()
  for sid,sname,aeid,ceid,caeid,cnote in cur:
    if sid in spells:
      spell = spells[sid]
    else:
      spell = {'name': sname, 'applied': Set(), 'combo': []}
      spells[sid] = spell
    if aeid is not None:
      spell['applied'].add(aeid)
      uniqueapplied.add(aeid)
    if (caeid is not None or cnote is not None):
      c = {'effect': ceid, 'applied': caeid, 'note': cnote}
      if c not in spell['combo']:
        spell['combo'].append(c)
  print '##Spells:\n'
  for spellid in spells:
    spell = spells[spellid]
    if spell['applied'] == Set():
      applied = ''
    else:
      applied = 'Applies **%s**' % ', '.join(effects[a] for a in spell['applied'])
    print '\n* ***%s***: %s\n' % (spell['name'], applied)
    for combo in spell['combo']:
      ename = effects[combo['effect']]
      outcome = []
      if combo['applied'] is not None:
        outcome.append('Applies **%s**' % effects[combo['applied']])
      if combo['note'] is not None:
        outcome.append('Note: *%s*' % combo['note'])
      print '1. Combo: **%s** -> %s\n' % (ename, '. '.join(outcome))
  if uniqueapplied:
    print '##Class effects:\n'
    print '* Direct: %s\n' % ', '.join('**%s**' % effects[a] for a in uniqueapplied)
    comboapplied = Set()
    selfcombo = Set()
    for spell in spells.values():
      for combo in spell['combo']:
        if not combo['applied']:
          continue
        comboapplied.add('**%s** -> **%s**' % (effects[combo['effect']], effects[combo['applied']]))
        if combo['effect'] in uniqueapplied:
          selfcombo.add((combo['effect'],combo['applied']))
    if comboapplied:
      print '* Combo: %s\n' % ', '.join(comboapplied)
      if selfcombo:
        print '* Self combo: %s\n' % ', '.join('**%s** -> **%s**' % (effects[sc[0]],effects[sc[1]]) for sc in selfcombo)



  print '\n***\n'

def showClasses(cur,classes,effects):
  for classid in classes:
    print '# ***%s***' % classes[classid]
    showClass(cur,classid,effects)

def main():
  conn,cur = connDB()
  cur.execute("""SELECT id,name FROM class""")
  classes = dict(cur.fetchall())
  cur.execute("""SELECT id,name FROM effect""")
  effects = dict(cur.fetchall())
  showClasses(cur,classes,effects)


if __name__ == '__main__':
  main()
