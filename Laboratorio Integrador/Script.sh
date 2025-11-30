#!/usr/bin/env bash
# lab_changes.sh
# Script para introducir cambios en el sistema (laboratorio de administración)
set -euo pipefail

LOG=/var/log/lab_changes.log
LABDIR=/opt/lab_exercise
CRONFILE=/etc/cron.d/lab_exercise
HOSTS_MARK="# LAB_EXERCISE_ENTRIES"
TIMESTAMP=$(date -Iseconds)

echo "=== INICIO lab_changes.sh: $TIMESTAMP ===" | tee -a "$LOG"

mkdir -p "$LABDIR"
chown root:root "$LABDIR"
chmod 755 "$LABDIR"

# 1) Crear usuarios
useradd -m -s /bin/bash alumno1
echo "Bienvenido alumno1" > /home/alumno1/README_LAB.txt
chown alumno1:alumno1 /home/alumno1/README_LAB.txt

useradd -m -s /bin/bash alumno2
passwd -l alumno2 >/dev/null 2>&1 || true
echo "archivo secreto" > /home/alumno2/.secreto
chown alumno2:alumno2 /home/alumno2/.secreto
chmod 600 /home/alumno2/.secreto

useradd -M -s /bin/bash nohome_user

# 2) Archivos y permisos
echo "Este archivo solo root debería verlo" > "$LABDIR/root_only.txt"
chmod 600 "$LABDIR/root_only.txt"

mkdir -p "$LABDIR/tmp_public"
echo "publico" > "$LABDIR/tmp_public/readme.txt"
chmod 1777 "$LABDIR/tmp_public"

echo "Este archivo parece pertenecer a otro usuario" > "$LABDIR/owner_mismatch.txt"
chown root:alumno1 "$LABDIR/owner_mismatch.txt"
chmod 640 "$LABDIR/owner_mismatch.txt"

ln -sf /nonexistent/roto "$LABDIR/broken_link"
ln -sf "$LABDIR/owner_mismatch.txt" "$LABDIR/link_to_mismatch"

# 3) Modificación en hosts
cp /etc/hosts /etc/hosts.bak.lab || true
cat >> /etc/hosts <<EOF
$HOSTS_MARK
127.0.0.1    servicio-interno.local
192.0.2.123  servicio-falso.example
$HOSTS_MARK
EOF

# 4) Cron job inofensivo
cat > "$CRONFILE" <<'CRON'
* * * * * root echo "cron_mark: $(date -Iseconds)" >> /var/tmp/lab_cron_marker.txt
CRON
chmod 644 "$CRONFILE"

# 5) Atributos especiales
if command -v chattr >/dev/null 2>&1; then
    echo "No me borres facilmente" > "$LABDIR/immutable_note.txt"
    chown root:root "$LABDIR/immutable_note.txt"
    chmod 644 "$LABDIR/immutable_note.txt"
    chattr +i "$LABDIR/immutable_note.txt" || true
fi

# 6) Script trampa
cat > /usr/local/bin/trampa <<'SH'
#!/usr/bin/env bash
echo "Pista: revisa permisos y cron." > /tmp/pista_trampa.txt
exit 0
SH
chmod 755 /usr/local/bin/trampa

echo "=== FIN lab_changes.sh ===" | tee -a "$LOG"
